// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'place_response.dart';

class PlaceResponseMapper extends ClassMapperBase<PlaceResponse> {
  PlaceResponseMapper._();

  static PlaceResponseMapper? _instance;
  static PlaceResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlaceResponseMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'PlaceResponse';

  static String _$id(PlaceResponse v) => v.id;
  static const Field<PlaceResponse, String> _f$id = Field('id', _$id);
  static String _$name(PlaceResponse v) => v.name;
  static const Field<PlaceResponse, String> _f$name = Field('name', _$name);
  static String _$imageUrl(PlaceResponse v) => v.imageUrl;
  static const Field<PlaceResponse, String> _f$imageUrl =
      Field('imageUrl', _$imageUrl);

  @override
  final Map<Symbol, Field<PlaceResponse, dynamic>> fields = const {
    #id: _f$id,
    #name: _f$name,
    #imageUrl: _f$imageUrl,
  };

  static PlaceResponse _instantiate(DecodingData data) {
    return PlaceResponse(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        imageUrl: data.dec(_f$imageUrl));
  }

  @override
  final Function instantiate = _instantiate;

  static PlaceResponse fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<PlaceResponse>(map));
  }

  static PlaceResponse fromJson(String json) {
    return _guard((c) => c.fromJson<PlaceResponse>(json));
  }
}

mixin PlaceResponseMappable {
  String toJson() {
    return PlaceResponseMapper._guard((c) => c.toJson(this as PlaceResponse));
  }

  Map<String, dynamic> toMap() {
    return PlaceResponseMapper._guard((c) => c.toMap(this as PlaceResponse));
  }

  PlaceResponseCopyWith<PlaceResponse, PlaceResponse, PlaceResponse>
      get copyWith => _PlaceResponseCopyWithImpl(
          this as PlaceResponse, $identity, $identity);
  @override
  String toString() {
    return PlaceResponseMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PlaceResponseMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PlaceResponseMapper._guard((c) => c.hash(this));
  }
}

extension PlaceResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PlaceResponse, $Out> {
  PlaceResponseCopyWith<$R, PlaceResponse, $Out> get $asPlaceResponse =>
      $base.as((v, t, t2) => _PlaceResponseCopyWithImpl(v, t, t2));
}

abstract class PlaceResponseCopyWith<$R, $In extends PlaceResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name, String? imageUrl});
  PlaceResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PlaceResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PlaceResponse, $Out>
    implements PlaceResponseCopyWith<$R, PlaceResponse, $Out> {
  _PlaceResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PlaceResponse> $mapper =
      PlaceResponseMapper.ensureInitialized();
  @override
  $R call({String? id, String? name, String? imageUrl}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (imageUrl != null) #imageUrl: imageUrl
      }));
  @override
  PlaceResponse $make(CopyWithData data) => PlaceResponse(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      imageUrl: data.get(#imageUrl, or: $value.imageUrl));

  @override
  PlaceResponseCopyWith<$R2, PlaceResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PlaceResponseCopyWithImpl($value, $cast, t);
}
