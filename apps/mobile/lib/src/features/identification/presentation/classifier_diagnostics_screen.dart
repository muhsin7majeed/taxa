import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/taxa_theme_extensions.dart';
import '../../../core/widgets/feature_status_panel.dart';
import '../../../core/widgets/taxa_async_state_panel.dart';
import '../../../core/widgets/taxa_info_tile.dart';
import '../../../core/widgets/taxa_metric_tile.dart';
import '../../../core/widgets/taxa_screen.dart';
import '../../../core/widgets/taxa_section_header.dart';
import '../data/classifier_compatibility_validator.dart';
import '../data/identification_providers.dart';
import '../data/tflite_classifier_providers.dart';
import '../data/tflite_classifier_readiness_checker.dart';
import '../domain/classifier_benchmark.dart';
import '../domain/classifier_model_config.dart';

class ClassifierDiagnosticsScreen extends ConsumerWidget {
  const ClassifierDiagnosticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(classifierModelConfigProvider);
    final benchmark = ref.watch(classifierBenchmarkProvider);
    final tfliteReadiness = ref.watch(tfliteClassifierReadinessProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Classifier Diagnostics')),
      body: TaxaScreen(
        children: [
          const TaxaSectionHeader(
            title: 'Classifier diagnostics',
            subtitle: 'Fake runtime timing and real-model readiness checks.',
          ),
          FeatureStatusPanel(
            icon: Icons.memory_outlined,
            eyebrow: 'Capture flow',
            title: 'Fake classifier active',
            body:
                'Capture still uses deterministic local predictions until the bundled TFLite model passes readiness checks on Android.',
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
                label: const Text('Run fake benchmark'),
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
            title: 'Fake benchmark',
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
              title: 'Fake benchmark unavailable',
              body:
                  'The active classifier could not complete a local benchmark run.',
            ),
            _ => const TaxaAsyncStatePanel.loading(
              title: 'Fake benchmark running',
              body: 'Timing the active local classifier.',
            ),
          },
          _TfliteReadinessPanel(
            readiness: tfliteReadiness,
            onRefresh: () => ref.invalidate(tfliteClassifierReadinessProvider),
          ),
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

class _TfliteReadinessPanel extends StatelessWidget {
  const _TfliteReadinessPanel({
    required this.readiness,
    required this.onRefresh,
  });

  final AsyncValue<TfliteClassifierReadiness> readiness;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final spacing = context.taxaSpacing;

    return switch (readiness) {
      AsyncData(:final value) => Column(
        children: [
          FeatureStatusPanel(
            icon: Icons.integration_instructions_outlined,
            eyebrow: 'TFLite readiness',
            title: 'Model path is compatible',
            body:
                '${value.modelVersion} matches ${value.labelCount} labels and expected tensor shapes.',
            action: OutlinedButton.icon(
              onPressed: onRefresh,
              icon: const Icon(Icons.refresh_outlined),
              label: const Text('Run TFLite check'),
            ),
          ),
          SizedBox(height: spacing.md),
          Row(
            children: [
              Expanded(
                child: TaxaMetricTile(
                  label: 'Input',
                  value: value.inputShapeLabel,
                  icon: Icons.input_outlined,
                ),
              ),
              SizedBox(width: spacing.md),
              Expanded(
                child: TaxaMetricTile(
                  label: 'Output',
                  value: value.outputShapeLabel,
                  icon: Icons.output_outlined,
                ),
              ),
            ],
          ),
          SizedBox(height: spacing.md),
          TaxaInfoTile(
            icon: Icons.label_outline,
            title: value.labelMapVersion,
            subtitle: '${value.labelCount} classifier labels are available.',
          ),
        ],
      ),
      AsyncError(:final error) => FeatureStatusPanel(
        icon: Icons.warning_amber_outlined,
        eyebrow: 'TFLite readiness',
        title: 'Model path not ready',
        body: _formatDiagnosticError(error),
        action: OutlinedButton.icon(
          onPressed: onRefresh,
          icon: const Icon(Icons.refresh_outlined),
          label: const Text('Run TFLite check'),
        ),
      ),
      _ => FeatureStatusPanel(
        icon: Icons.hourglass_empty_outlined,
        eyebrow: 'TFLite readiness',
        title: 'Checking model path',
        body:
            'Loading labels and checking whether the real TFLite model asset can be opened.',
        action: OutlinedButton.icon(
          onPressed: null,
          icon: SizedBox.square(
            dimension: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          label: Text('Checking'),
        ),
      ),
    };
  }

  String _formatDiagnosticError(Object error) {
    if (error is ClassifierCompatibilityException) {
      return error.message;
    }

    final message = error.toString();
    if (message.contains('Unable to load asset')) {
      return 'The configured TFLite model asset is not bundled yet.';
    }

    return message;
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
