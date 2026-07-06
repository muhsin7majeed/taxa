import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/taxa_theme_extensions.dart';
import '../../../core/widgets/feature_status_panel.dart';
import '../../../core/widgets/taxa_async_state_panel.dart';
import '../../../core/widgets/taxa_info_tile.dart';
import '../../../core/widgets/taxa_metric_tile.dart';
import '../../../core/widgets/taxa_screen.dart';
import '../../../core/widgets/taxa_section_header.dart';
import '../data/identification_providers.dart';
import '../domain/classifier_benchmark.dart';
import '../domain/classifier_model_config.dart';

class ClassifierDiagnosticsScreen extends ConsumerWidget {
  const ClassifierDiagnosticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(classifierModelConfigProvider);
    final benchmark = ref.watch(classifierBenchmarkProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Classifier Diagnostics')),
      body: TaxaScreen(
        children: [
          const TaxaSectionHeader(
            title: 'Classifier diagnostics',
            subtitle: 'Local runtime metadata and benchmark timing.',
          ),
          FeatureStatusPanel(
            icon: Icons.memory_outlined,
            eyebrow: 'Active classifier',
            title: config.modelVersion,
            body:
                'Fake classifier remains active until a real model asset is available.',
            action: switch (benchmark) {
              AsyncLoading() => FilledButton.icon(
                onPressed: null,
                icon: const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                label: const Text('Running'),
              ),
              _ => FilledButton.icon(
                onPressed: () => ref.invalidate(classifierBenchmarkProvider),
                icon: const Icon(Icons.speed_outlined),
                label: const Text('Run benchmark'),
              ),
            },
          ),
          Row(
            children: [
              Expanded(
                child: TaxaMetricTile(
                  label: 'Threshold',
                  value: _formatPercent(config.threshold),
                  icon: Icons.rule_outlined,
                ),
              ),
              SizedBox(width: context.taxaSpacing.md),
              Expanded(
                child: TaxaMetricTile(
                  label: 'Delegate',
                  value: _delegateLabel(config),
                  icon: Icons.tune_outlined,
                ),
              ),
            ],
          ),
          const TaxaInfoTile(
            icon: Icons.info_outline,
            title: 'Current benchmark uses fake classifier',
            subtitle:
                'The timing below measures simulated analysis latency, not real TFLite inference yet.',
          ),
          TaxaInfoTile(
            icon: Icons.label_outline,
            title: config.labelMapVersion,
            subtitle: config.labelMapAssetPath,
          ),
          TaxaInfoTile(
            icon: Icons.storage_outlined,
            title: 'Model asset',
            subtitle: config.modelAssetPath,
          ),
          switch (benchmark) {
            AsyncData(:final value) => _BenchmarkSummaryPanel(summary: value),
            AsyncError() => const TaxaAsyncStatePanel.error(
              title: 'Benchmark unavailable',
              body:
                  'The active classifier could not complete a local benchmark run.',
            ),
            _ => const TaxaAsyncStatePanel.loading(
              title: 'Benchmark running',
              body: 'Timing the active local classifier.',
            ),
          },
        ],
      ),
    );
  }

  String _delegateLabel(ClassifierModelConfig config) {
    return switch (config.delegatePreference) {
      ClassifierDelegatePreference.cpu => 'CPU',
      ClassifierDelegatePreference.gpu => 'GPU',
      ClassifierDelegatePreference.nnapi => 'NNAPI',
    };
  }

  String _formatPercent(double value) {
    return '${(value * 100).round()}%';
  }
}

class _BenchmarkSummaryPanel extends StatelessWidget {
  const _BenchmarkSummaryPanel({required this.summary});

  final ClassifierBenchmarkSummary summary;

  @override
  Widget build(BuildContext context) {
    final prediction = summary.topPrediction;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TaxaMetricTile(
                label: 'Average',
                value: _formatDuration(summary.averageLatency),
                icon: Icons.timer_outlined,
              ),
            ),
            SizedBox(width: context.taxaSpacing.md),
            Expanded(
              child: TaxaMetricTile(
                label: 'Runs',
                value: '${summary.iterations}',
                icon: Icons.repeat,
              ),
            ),
          ],
        ),
        SizedBox(height: context.taxaSpacing.md),
        TaxaInfoTile(
          icon: Icons.analytics_outlined,
          title: prediction?.commonName ?? 'No top prediction',
          subtitle: prediction == null
              ? 'The classifier did not return top-k output.'
              : '${_formatPercent(prediction.confidence)} confidence, ${summary.runtimeLabel}',
        ),
        SizedBox(height: context.taxaSpacing.md),
        TaxaInfoTile(
          icon: Icons.speed_outlined,
          title:
              'Fastest ${_formatDuration(summary.fastestLatency)} / slowest ${_formatDuration(summary.slowestLatency)}',
          subtitle: 'Last run ${_formatLocalTime(summary.ranAt)}',
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    if (duration.inMilliseconds == 0) {
      return '${duration.inMicroseconds}us';
    }

    return '${duration.inMilliseconds}ms';
  }

  String _formatPercent(double value) {
    return '${(value * 100).round()}%';
  }

  String _formatLocalTime(DateTime value) {
    final local = value.toLocal();
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    final second = local.second.toString().padLeft(2, '0');

    return '$hour:$minute:$second';
  }
}
