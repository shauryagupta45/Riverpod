// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchUserHash() => r'f1505d3f8d0f58dffad04738fdf9a23a71177641';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchUser].
@ProviderFor(fetchUser)
const fetchUserProvider = FetchUserFamily();

/// See also [fetchUser].
class FetchUserFamily extends Family<AsyncValue<UserHttp>> {
  /// See also [fetchUser].
  const FetchUserFamily();

  /// See also [fetchUser].
  FetchUserProvider call({
    required String input,
    required int num,
    required bool valuee,
  }) {
    return FetchUserProvider(
      input: input,
      num: num,
      valuee: valuee,
    );
  }

  @override
  FetchUserProvider getProviderOverride(
    covariant FetchUserProvider provider,
  ) {
    return call(
      input: provider.input,
      num: provider.num,
      valuee: provider.valuee,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchUserProvider';
}

/// See also [fetchUser].
class FetchUserProvider extends AutoDisposeFutureProvider<UserHttp> {
  /// See also [fetchUser].
  FetchUserProvider({
    required String input,
    required int num,
    required bool valuee,
  }) : this._internal(
          (ref) => fetchUser(
            ref as FetchUserRef,
            input: input,
            num: num,
            valuee: valuee,
          ),
          from: fetchUserProvider,
          name: r'fetchUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserHash,
          dependencies: FetchUserFamily._dependencies,
          allTransitiveDependencies: FetchUserFamily._allTransitiveDependencies,
          input: input,
          num: num,
          valuee: valuee,
        );

  FetchUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.input,
    required this.num,
    required this.valuee,
  }) : super.internal();

  final String input;
  final int num;
  final bool valuee;

  @override
  Override overrideWith(
    FutureOr<UserHttp> Function(FetchUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUserProvider._internal(
        (ref) => create(ref as FetchUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        input: input,
        num: num,
        valuee: valuee,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserHttp> createElement() {
    return _FetchUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserProvider &&
        other.input == input &&
        other.num == num &&
        other.valuee == valuee;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, input.hashCode);
    hash = _SystemHash.combine(hash, num.hashCode);
    hash = _SystemHash.combine(hash, valuee.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUserRef on AutoDisposeFutureProviderRef<UserHttp> {
  /// The parameter `input` of this provider.
  String get input;

  /// The parameter `num` of this provider.
  int get num;

  /// The parameter `valuee` of this provider.
  bool get valuee;
}

class _FetchUserProviderElement
    extends AutoDisposeFutureProviderElement<UserHttp> with FetchUserRef {
  _FetchUserProviderElement(super.provider);

  @override
  String get input => (origin as FetchUserProvider).input;
  @override
  int get num => (origin as FetchUserProvider).num;
  @override
  bool get valuee => (origin as FetchUserProvider).valuee;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
