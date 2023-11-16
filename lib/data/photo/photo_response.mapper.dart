// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'photo_response.dart';

class PhotoResponseMapper extends ClassMapperBase<PhotoResponse> {
  PhotoResponseMapper._();

  static PhotoResponseMapper? _instance;
  static PhotoResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PhotoResponseMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'PhotoResponse';

  static String _$id(PhotoResponse v) => v.id;
  static const Field<PhotoResponse, String> _f$id = Field('id', _$id);
  static String _$name(PhotoResponse v) => v.name;
  static const Field<PhotoResponse, String> _f$name = Field('name', _$name);
  static String _$imageUrl(PhotoResponse v) => v.imageUrl;
  static const Field<PhotoResponse, String> _f$imageUrl =
      Field('imageUrl', _$imageUrl);
  static List<PlaceEntity> _$places(PhotoResponse v) => v.places;
  static const Field<PhotoResponse, List<PlaceEntity>> _f$places =
      Field('places', _$places);

  @override
  final Map<Symbol, Field<PhotoResponse, dynamic>> fields = const {
    #id: _f$id,
    #name: _f$name,
    #imageUrl: _f$imageUrl,
    #places: _f$places,
  };

  static PhotoResponse _instantiate(DecodingData data) {
    return PhotoResponse(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        imageUrl: data.dec(_f$imageUrl),
        places: data.dec(_f$places));
  }

  @override
  final Function instantiate = _instantiate;

  static PhotoResponse fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<PhotoResponse>(map));
  }

  static PhotoResponse fromJson(String json) {
    return _guard((c) => c.fromJson<PhotoResponse>(json));
  }
}

mixin PhotoResponseMappable {
  String toJson() {
    return PhotoResponseMapper._guard((c) => c.toJson(this as PhotoResponse));
  }

  Map<String, dynamic> toMap() {
    return PhotoResponseMapper._guard((c) => c.toMap(this as PhotoResponse));
  }

  PhotoResponseCopyWith<PhotoResponse, PhotoResponse, PhotoResponse>
      get copyWith => _PhotoResponseCopyWithImpl(
          this as PhotoResponse, $identity, $identity);
  @override
  String toString() {
    return PhotoResponseMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PhotoResponseMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PhotoResponseMapper._guard((c) => c.hash(this));
  }
}

extension PhotoResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PhotoResponse, $Out> {
  PhotoResponseCopyWith<$R, PhotoResponse, $Out> get $asPhotoResponse =>
      $base.as((v, t, t2) => _PhotoResponseCopyWithImpl(v, t, t2));
}

abstract class PhotoResponseCopyWith<$R, $In extends PhotoResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, PlaceEntity, ObjectCopyWith<$R, PlaceEntity, PlaceEntity>>
      get places;
  $R call(
      {String? id, String? name, String? imageUrl, List<PlaceEntity>? places});
  PhotoResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PhotoResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PhotoResponse, $Out>
    implements PhotoResponseCopyWith<$R, PhotoResponse, $Out> {
  _PhotoResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PhotoResponse> $mapper =
      PhotoResponseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, PlaceEntity, ObjectCopyWith<$R, PlaceEntity, PlaceEntity>>
      get places => ListCopyWith($value.places,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(places: v));
  @override
  $R call(
          {String? id,
          String? name,
          String? imageUrl,
          List<PlaceEntity>? places}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (imageUrl != null) #imageUrl: imageUrl,
        if (places != null) #places: places
      }));
  @override
  PhotoResponse $make(CopyWithData data) => PhotoResponse(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      imageUrl: data.get(#imageUrl, or: $value.imageUrl),
      places: data.get(#places, or: $value.places));

  @override
  PhotoResponseCopyWith<$R2, PhotoResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PhotoResponseCopyWithImpl($value, $cast, t);
}
