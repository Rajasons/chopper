class EtaRequest {

  bool? success;
  String? message;
  List<Data>? data;

  EtaRequest({this.success, this.message, this.data});

  EtaRequest.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class Data {
  String? zoneTypeId;
  String? name;
  String? vehicleIcon;
  String? description;
  String? shortDescription;
  String? supportedVehicles;
  String? size;
  int? capacity;
  String? paymentType;
  bool? isDefault;
  bool? enableBidding;
  String? icon;
  String? typeId;
  int? userWalletBalance;
  bool? hasDiscount;
  int? discountAmount;
  int? distance;
  double? time;
  int? baseDistance;
  int? basePrice;
  int? pricePerDistance;
  int? pricePerTime;
  int? distancePrice;
  int? timePrice;
  int? rideFare;
  int? taxAmount;
  int? withoutDiscountAdminCommision;
  int? discountAdminCommision;
  String? tax;
  int? total;
  int? approximateValue;
  int? minAmount;
  dynamic maxAmount;
  String? currency;
  String? currencyName;
  String? typeName;
  int? unit;
  String? unitInWordsWithoutLang;
  String? unitInWords;
  int? airportSurgeFee;
  String? biddingLowPercentage;
  String? biddingHighPercentage;

  Data({this.zoneTypeId,
        this.name,
        this.vehicleIcon,
        this.description,
        this.shortDescription,
        this.supportedVehicles,
        this.size,
        this.capacity,
        this.paymentType,
        this.isDefault,
        this.enableBidding,
        this.icon,
        this.typeId,
        this.userWalletBalance,
        this.hasDiscount,
        this.discountAmount,
        this.distance,
        this.time,
        this.baseDistance,
        this.basePrice,
        this.pricePerDistance,
        this.pricePerTime,
        this.distancePrice,
        this.timePrice,
        this.rideFare,
        this.taxAmount,
        this.withoutDiscountAdminCommision,
        this.discountAdminCommision,
        this.tax,
        this.total,
        this.approximateValue,
        this.minAmount,
        this.maxAmount,
        this.currency,
        this.currencyName,
        this.typeName,
        this.unit,
        this.unitInWordsWithoutLang,
        this.unitInWords,
        this.airportSurgeFee,
        this.biddingLowPercentage,
        this.biddingHighPercentage});

  Data.fromJson(Map<String, dynamic> json) {
    zoneTypeId = json['zone_type_id'];
    name = json['name'];
    vehicleIcon = json['vehicle_icon'];
    description = json['description'];
    shortDescription = json['short_description'];
    supportedVehicles = json['supported_vehicles'];
    size = json['size'];
    capacity = json['capacity'];
    paymentType = json['payment_type'];
    isDefault = json['is_default'];
    enableBidding = json['enable_bidding'];
    icon = json['icon'];
    typeId = json['type_id'];
    userWalletBalance = json['user_wallet_balance'];
    hasDiscount = json['has_discount'];
    discountAmount = json['discount_amount'];
    distance = json['distance'];
    time = json['time'];
    baseDistance = json['base_distance'];
    basePrice = json['base_price'];
    pricePerDistance = json['price_per_distance'];
    pricePerTime = json['price_per_time'];
    distancePrice = json['distance_price'];
    timePrice = json['time_price'];
    rideFare = json['ride_fare'];
    taxAmount = json['tax_amount'];
    withoutDiscountAdminCommision = json['without_discount_admin_commision'];
    discountAdminCommision = json['discount_admin_commision'];
    tax = json['tax'];
    total = json['total'];
    approximateValue = json['approximate_value'];
    minAmount = json['min_amount'];
    maxAmount = json['max_amount'];
    currency = json['currency'];
    currencyName = json['currency_name'];
    typeName = json['type_name'];
    unit = json['unit'];
    unitInWordsWithoutLang = json['unit_in_words_without_lang'];
    unitInWords = json['unit_in_words'];
    airportSurgeFee = json['airport_surge_fee'];
    biddingLowPercentage = json['bidding_low_percentage'];
    biddingHighPercentage = json['bidding_high_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zone_type_id'] = this.zoneTypeId;
    data['name'] = this.name;
    data['vehicle_icon'] = this.vehicleIcon;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['supported_vehicles'] = this.supportedVehicles;
    data['size'] = this.size;
    data['capacity'] = this.capacity;
    data['payment_type'] = this.paymentType;
    data['is_default'] = this.isDefault;
    data['enable_bidding'] = this.enableBidding;
    data['icon'] = this.icon;
    data['type_id'] = this.typeId;
    data['user_wallet_balance'] = this.userWalletBalance;
    data['has_discount'] = this.hasDiscount;
    data['discount_amount'] = this.discountAmount;
    data['distance'] = this.distance;
    data['time'] = this.time;
    data['base_distance'] = this.baseDistance;
    data['base_price'] = this.basePrice;
    data['price_per_distance'] = this.pricePerDistance;
    data['price_per_time'] = this.pricePerTime;
    data['distance_price'] = this.distancePrice;
    data['time_price'] = this.timePrice;
    data['ride_fare'] = this.rideFare;
    data['tax_amount'] = this.taxAmount;
    data['without_discount_admin_commision'] =
        this.withoutDiscountAdminCommision;
    data['discount_admin_commision'] = this.discountAdminCommision;
    data['tax'] = this.tax;
    data['total'] = this.total;
    data['approximate_value'] = this.approximateValue;
    data['min_amount'] = this.minAmount;
    data['max_amount'] = this.maxAmount;
    data['currency'] = this.currency;
    data['currency_name'] = this.currencyName;
    data['type_name'] = this.typeName;
    data['unit'] = this.unit;
    data['unit_in_words_without_lang'] = this.unitInWordsWithoutLang;
    data['unit_in_words'] = this.unitInWords;
    data['airport_surge_fee'] = this.airportSurgeFee;
    data['bidding_low_percentage'] = this.biddingLowPercentage;
    data['bidding_high_percentage'] = this.biddingHighPercentage;
    return data;
  }
}
