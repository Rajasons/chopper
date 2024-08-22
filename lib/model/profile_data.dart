class UserProfileData {
  final int id;
  final String name;
  final String gender;
  final String? lastName;
  final String? username;
  final String email;
  final String mobile;
  final String profilePicture;
  final int active;
  final int emailConfirmed;
  final int mobileConfirmed;
  final String lastKnownIp;
  final String lastLoginAt;
  final int rating;
  final int noOfRatings;
  final String referralCode;
  final String currencyCode;
  final String currencySymbol;
  final String countryCode;
  final bool showRentalRide;
  final bool showRideLaterFeature;
  final String? authorizationCode;
  final String enableModulesForApplications;
  final String contactUsMobile1;
  final String contactUsMobile2;
  final String contactUsLink;
  final bool showWalletMoneyTransferFeatureOnMobileApp;
  final bool showBankInfoFeatureOnMobileApp;
  final bool showWalletFeatureOnMobileApp;
  final int notificationsCount;
  final String referralCommissionString;
  final String userCanMakeARideAfterXMinutes;
  final int maximumTimeForFindDriversForRegularRide;
  final String maximumTimeForFindDriversForBittingRide;
  final bool enableDriverPreferenceForUser;
  final bool enablePetPreferenceForUser;
  final bool enableLuggagePreferenceForUser;
  final String biddingAmountIncreaseOrDecrease;
  final bool showRideWithoutDestination;
  final bool enableCountryRestrictOnMap;
  final String? chatId;
  final String mapType;
  final bool hasOngoingRide;
  final bool showOutstationRideFeature;
  final List<dynamic> sosData;
  final List<BannerImage> bannerImages;
  final WalletData wallet;
  final dynamic onTripRequest;
  final dynamic metaRequest;
  final List<dynamic> favouriteLocations;
  final dynamic laterMetaRequest;

  UserProfileData({
    required this.id,
    required this.name,
    required this.gender,
    this.lastName,
    this.username,
    required this.email,
    required this.mobile,
    required this.profilePicture,
    required this.active,
    required this.emailConfirmed,
    required this.mobileConfirmed,
    required this.lastKnownIp,
    required this.lastLoginAt,
    required this.rating,
    required this.noOfRatings,
    required this.referralCode,
    required this.currencyCode,
    required this.currencySymbol,
    required this.countryCode,
    required this.showRentalRide,
    required this.showRideLaterFeature,
    this.authorizationCode,
    required this.enableModulesForApplications,
    required this.contactUsMobile1,
    required this.contactUsMobile2,
    required this.contactUsLink,
    required this.showWalletMoneyTransferFeatureOnMobileApp,
    required this.showBankInfoFeatureOnMobileApp,
    required this.showWalletFeatureOnMobileApp,
    required this.notificationsCount,
    required this.referralCommissionString,
    required this.userCanMakeARideAfterXMinutes,
    required this.maximumTimeForFindDriversForRegularRide,
    required this.maximumTimeForFindDriversForBittingRide,
    required this.enableDriverPreferenceForUser,
    required this.enablePetPreferenceForUser,
    required this.enableLuggagePreferenceForUser,
    required this.biddingAmountIncreaseOrDecrease,
    required this.showRideWithoutDestination,
    required this.enableCountryRestrictOnMap,
    this.chatId,
    required this.mapType,
    required this.hasOngoingRide,
    required this.showOutstationRideFeature,
    required this.sosData,
    required this.bannerImages,
    required this.wallet,
    this.onTripRequest,
    this.metaRequest,
    required this.favouriteLocations,
    this.laterMetaRequest,
  });

  factory UserProfileData.fromJson(Map<String, dynamic> json) {
    return UserProfileData(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      lastName: json['last_name'],
      username: json['username'],
      email: json['email'],
      mobile: json['mobile'],
      profilePicture: json['profile_picture'],
      active: json['active'],
      emailConfirmed: json['email_confirmed'],
      mobileConfirmed: json['mobile_confirmed'],
      lastKnownIp: json['last_known_ip'],
      lastLoginAt: json['last_login_at'],
      rating: json['rating'],
      noOfRatings: json['no_of_ratings'],
      referralCode: json['refferal_code'],
      currencyCode: json['currency_code'],
      currencySymbol: json['currency_symbol'],
      countryCode: json['country_code'],
      showRentalRide: json['show_rental_ride'],
      showRideLaterFeature: json['show_ride_later_feature'],
      authorizationCode: json['authorization_code'],
      enableModulesForApplications: json['enable_modules_for_applications'],
      contactUsMobile1: json['contact_us_mobile1'],
      contactUsMobile2: json['contact_us_mobile2'],
      contactUsLink: json['contact_us_link'],
      showWalletMoneyTransferFeatureOnMobileApp: json['show_wallet_money_transfer_feature_on_mobile_app'] == "1",
      showBankInfoFeatureOnMobileApp: json['show_bank_info_feature_on_mobile_app'] == "1",
      showWalletFeatureOnMobileApp: json['show_wallet_feature_on_mobile_app'] == "1",
      notificationsCount: json['notifications_count'],
      referralCommissionString: json['referral_comission_string'],
      userCanMakeARideAfterXMinutes: json['user_can_make_a_ride_after_x_miniutes'],
      maximumTimeForFindDriversForRegularRide: json['maximum_time_for_find_drivers_for_regular_ride'],
      maximumTimeForFindDriversForBittingRide: json['maximum_time_for_find_drivers_for_bitting_ride'],
      enableDriverPreferenceForUser: json['enable_driver_preference_for_user'] == "1",
      enablePetPreferenceForUser: json['enable_pet_preference_for_user'] == "1",
      enableLuggagePreferenceForUser: json['enable_luggage_preference_for_user'] == "1",
      biddingAmountIncreaseOrDecrease: json['bidding_amount_increase_or_decrease'],
      showRideWithoutDestination: json['show_ride_without_destination'] == "1",
      enableCountryRestrictOnMap: json['enable_country_restrict_on_map'] == "0",
      chatId: json['chat_id'],
      mapType: json['map_type'],
      hasOngoingRide: json['has_ongoing_ride'],
      showOutstationRideFeature: json['show_outstation_ride_feature'] == "1",
      sosData: json['sos']['data'],
      bannerImages: (json['bannerImage']['data'] as List).map((e) => BannerImage.fromJson(e)).toList(),
      wallet: WalletData.fromJson(json['wallet']['data']),
      onTripRequest: json['onTripRequest'],
      metaRequest: json['metaRequest'],
      favouriteLocations: json['favouriteLocations']['data'],
      laterMetaRequest: json['laterMetaRequest'],
    );
  }
}

class BannerImage {
  final String image;

  BannerImage({required this.image});

  factory BannerImage.fromJson(Map<String, dynamic> json) {
    return BannerImage(
      image: json['image'],
    );
  }
}

class WalletData {
  final String id;
  final int userId;
  final int amountAdded;
  final int amountBalance;
  final int amountSpent;
  final String currencySymbol;
  final String currencyCode;
  final String createdAt;
  final String updatedAt;

  WalletData({
    required this.id,
    required this.userId,
    required this.amountAdded,
    required this.amountBalance,
    required this.amountSpent,
    required this.currencySymbol,
    required this.currencyCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WalletData.fromJson(Map<String, dynamic> json) {
    return WalletData(
      id: json['id'],
      userId: json['user_id'],
      amountAdded: json['amount_added'],
      amountBalance: json['amount_balance'],
      amountSpent: json['amount_spent'],
      currencySymbol: json['currency_symbol'],
      currencyCode: json['currency_code'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
