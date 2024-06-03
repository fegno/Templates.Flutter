// ignore_for_file: public_member_api_docs

class HomeEntity {
  HomeEntity({
    this.zone,
    this.profilePercentage,
    this.content,
  });

  factory HomeEntity.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return HomeEntity(
      zone: json['zone'] == null ? null : InstitutionClass.fromJson(json['zone'] as Map<String, dynamic>),
      profilePercentage: json['profile_percentage'] as num?,
      content: json['content'] == null ? [] : List<HomeEntityContent>.from((json['content'] as List).map(HomeEntityContent.fromJson)),
    );
  }
  final InstitutionClass? zone;
  final num? profilePercentage;
  final List<HomeEntityContent>? content;
}

class HomeEntityContent {
  HomeEntityContent({
    this.model,
    this.title,
    this.slug,
    this.content,
    this.viewAll,
    this.bg,
    this.color,
  });

  factory HomeEntityContent.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return HomeEntityContent(
      model: json['model'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      content: json['content'] == null ? [] : List<HomeContent>.from((json['content'] as List).map(HomeContent.fromJson)),
      viewAll: json['view_all'],
      bg: json['bg'] as String?,
      color: json['color'] as String?,
    );
  }
  final String? model;
  final String? title;
  final String? slug;
  final List<HomeContent>? content;
  final dynamic viewAll;
  final String? bg;
  final String? color;
}

class HomeContent {
  HomeContent({
    this.title,
    this.id,
    this.amount,
    this.expired,
    this.plan,
    this.noOfDaysToExpire,
    this.name,
    this.logo,
    this.description,
    this.fitnessCenter,
    this.image,
    this.institution,
    this.plans,
    this.images,
    this.banner,
    this.mobile,
    this.email,
    this.location,
    this.contact,
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    this.instagramUrl,
    this.facebookUrl,
    this.youtubeUrl,
    this.gstNumber,
    this.licenseNumber,
    this.isPublic,
    this.active,
    this.user,
    this.zone,
    this.fitnessCenterPlan,
    this.workingTime,
    this.amenities,
    this.category,
    this.rules,
    this.km,
    this.isCourseAndDietPlan,
    this.canAddGst,
    this.canAddReview,
    this.canAddRating,
    this.canEditReview,
    this.canEditRating,
    this.totalRating,
    this.review,
  });

  factory HomeContent.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return HomeContent(
      title: json['title'] as String?,
      id: json['id'] as num?,
      amount: json['amount'] as num?,
      expired: json['expired'] as bool?,
      plan: json['plan'] as num?,
      noOfDaysToExpire: json['no_of_days_to_expire'] as num?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      description: json['description'] as String?,
      fitnessCenter: json['fitness_center'] == null ? null : HomeFitnessCenter.fromJson(json['fitness_center'] as Map<String, dynamic>),
      image: json['image'] as String?,
      institution: json['institution'] == null ? null : InstitutionClass.fromJson(json['institution'] as Map<String, dynamic>),
      plans: json['plans'] == null ? [] : List<HomePlan>.from((json['plans'] as List).map(HomePlan.fromJson)),
      images: json['images'] == null ? [] : List<HomeImage>.from((json['images'] as List).map(HomeImage.fromJson)),
      banner: json['banner'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      location: json['location'] as String?,
      contact: json['contact'] as String?,
      addressLine1: json['address_line1'] as String?,
      addressLine2: json['address_line2'] as String?,
      addressLine3: json['address_line3'] as String?,
      addressLine4: json['address_line4'] as String?,
      instagramUrl: json['instagram_URL'] as String?,
      facebookUrl: json['facebook_URL'] as String?,
      youtubeUrl: json['youtube_URL'] as String?,
      gstNumber: json['GST_Number'],
      licenseNumber: json['license_number'],
      isPublic: json['is_public'] as bool?,
      active: json['active'] as bool?,
      user: json['user'] as num?,
      zone: json['zone'] == null ? null : PurpleZone.fromJson(json['zone'] as Map<String, dynamic>),
      fitnessCenterPlan: json['fitness_center_plan'] as num?,
      workingTime: json['working_time'] == null ? [] : List<WorkingTime>.from((json['working_time'] as List).map(WorkingTime.fromJson)),
      amenities: json['amenities'] == null ? [] : List<HomeAmenity>.from((json['amenities'] as List).map(HomeAmenity.fromJson)),
      category: json['category'] == null ? [] : List<HomeAmenity>.from((json['category'] as List).map(HomeAmenity.fromJson)),
      rules: json['rules'] == null ? [] : List<Rule>.from((json['rules'] as List).map(Rule.fromJson)),
      km: json['km'] as num?,
      isCourseAndDietPlan: json['is_course_and_diet_plan'] as bool?,
      canAddGst: json['can_add_gst'] as bool?,
      canAddReview: json['can_add_review'] as bool?,
      canAddRating: json['can_add_rating'] as bool?,
      canEditReview: json['can_edit_review'] as bool?,
      canEditRating: json['can_edit_rating'] as bool?,
      totalRating: json['total_rating'] as num?,
      review: json['review'] == null ? [] : List<Review>.from((json['review'] as List).map(Review.fromJson)),
    );
  }
  final String? title;
  final num? id;
  final num? amount;
  final bool? expired;
  final num? plan;
  final num? noOfDaysToExpire;
  final String? name;
  final String? logo;
  final String? description;
  final HomeFitnessCenter? fitnessCenter;
  final String? image;
  final InstitutionClass? institution;
  final List<HomePlan>? plans;
  final List<HomeImage>? images;
  final String? banner;
  final String? mobile;
  final String? email;
  final String? location;
  final String? contact;
  final String? addressLine1;
  final String? addressLine2;
  final String? addressLine3;
  final String? addressLine4;
  final String? instagramUrl;
  final String? facebookUrl;
  final String? youtubeUrl;
  final dynamic gstNumber;
  final dynamic licenseNumber;
  final bool? isPublic;
  final bool? active;
  final num? user;
  final PurpleZone? zone;
  final num? fitnessCenterPlan;
  final List<WorkingTime>? workingTime;
  final List<HomeAmenity>? amenities;
  final List<HomeAmenity>? category;
  final List<Rule>? rules;
  final num? km;
  final bool? isCourseAndDietPlan;
  final bool? canAddGst;
  final bool? canAddReview;
  final bool? canAddRating;
  final bool? canEditReview;
  final bool? canEditRating;
  final num? totalRating;
  final List<Review>? review;
}

class HomeAmenity {
  HomeAmenity({
    this.id,
    this.name,
    this.logo,
  });

  factory HomeAmenity.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return HomeAmenity(
      id: json['id'] as num?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
    );
  }
  final num? id;
  final String? name;
  final String? logo;
}

class HomeFitnessCenter {
  HomeFitnessCenter({
    this.id,
    this.name,
    this.logo,
    this.location,
    this.km,
  });

  factory HomeFitnessCenter.fromJson(Map<String, dynamic> json) => HomeFitnessCenter(
        id: json['id'] as num?,
        name: json['name'] as String?,
        logo: json['logo'] as String?,
        location: json['location'] as String?,
        km: json['km'],
      );
  final num? id;
  final String? name;
  final String? logo;
  final String? location;
  final dynamic km;
}

class HomeImage {
  HomeImage({
    this.id,
    this.image,
  });

  factory HomeImage.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return HomeImage(
      id: json['id'] as num?,
      image: json['image'] as String?,
    );
  }
  final num? id;
  final String? image;
}

class InstitutionClass {
  InstitutionClass({
    this.id,
    this.name,
  });

  factory InstitutionClass.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return InstitutionClass(
      id: json['id'] as num?,
      name: json['name'] as String?,
    );
  }
  final num? id;
  final String? name;
}

class HomePlan {
  HomePlan({
    this.id,
    this.duration,
    this.name,
    this.description,
    this.amount,
    this.isTrendingNow,
    this.isCoursePlan,
    this.isDietPlan,
    this.isActive,
    this.fitnessCenter,
    this.subscribed,
  });

  factory HomePlan.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return HomePlan(
      id: json['id'] as num?,
      duration: json['duration'] as num?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      amount: json['amount'] as num?,
      isTrendingNow: json['is_trending_now'] as bool?,
      isCoursePlan: json['is_course_plan'] as bool?,
      isDietPlan: json['is_diet_plan'] as bool?,
      isActive: json['is_active'] as bool?,
      fitnessCenter: json['fitness_center'] as num?,
      subscribed: json['subscribed'] as bool?,
    );
  }
  final num? id;
  final num? duration;
  final String? name;
  final String? description;
  final num? amount;
  final bool? isTrendingNow;
  final bool? isCoursePlan;
  final bool? isDietPlan;
  final bool? isActive;
  final num? fitnessCenter;
  final bool? subscribed;
}

class Review {
  Review({
    this.user,
    this.review,
    this.rating,
    this.id,
    this.created,
    this.updated,
    this.userPhoto,
    this.canAddComment,
    this.comments,
  });

  factory Review.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return Review(
      user: json['user'] as String?,
      review: json['review'] as String?,
      rating: json['rating'] as num?,
      id: json['id'] as num?,
      created: json['created'] == null ? null : Ated.fromJson(json['created'] as Map<String, dynamic>),
      updated: json['updated'] == null ? null : Ated.fromJson(json['updated'] as Map<String, dynamic>),
      userPhoto: json['user_photo'] == null ? null : UserPhoto.fromJson(json['user_photo'] as Map<String, dynamic>),
      canAddComment: json['can_add_comment'] as bool?,
      comments: json['comments'] == null ? [] : List<dynamic>.from((json['comments'] as List).map((x) => x)),
    );
  }
  final String? user;
  final String? review;
  final num? rating;
  final num? id;
  final Ated? created;
  final Ated? updated;
  final UserPhoto? userPhoto;
  final bool? canAddComment;
  final List<dynamic>? comments;
}

class Ated {
  Ated({
    this.date,
    this.time,
  });

  factory Ated.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return Ated(
      date: json['date'] as String?,
      time: json['time'] as String?,
    );
  }
  final String? date;
  final String? time;
}

class UserPhoto {
  UserPhoto({
    this.image,
  });

  factory UserPhoto.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return UserPhoto(
      image: json['image'] as String?,
    );
  }
  final String? image;
}

class Rule {
  Rule({
    this.name,
    this.description,
    this.id,
  });

  factory Rule.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return Rule(
      name: json['name'] as String?,
      description: json['description'] as String?,
      id: json['id'] as num?,
    );
  }
  final String? name;
  final String? description;
  final num? id;
}

class WorkingTime {
  WorkingTime({
    this.id,
    this.opensAt,
    this.closesAt,
    this.title,
    this.openTimeType,
    this.closeTimeType,
    this.isActive,
  });

  factory WorkingTime.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return WorkingTime(
      id: json['id'] as num?,
      opensAt: json['opens_at'] as String?,
      closesAt: json['closes_at'] as String?,
      title: json['title'] as String?,
      openTimeType: json['open_time_type'] as num?,
      closeTimeType: json['close_time_type'] as num?,
      isActive: json['is_active'] as bool?,
    );
  }
  final num? id;
  final String? opensAt;
  final String? closesAt;
  final String? title;
  final num? openTimeType;
  final num? closeTimeType;
  final bool? isActive;
}

class PurpleZone {
  PurpleZone({
    this.id,
    this.name,
    this.location,
  });

  factory PurpleZone.fromJson(dynamic data) {
    var json = <String, dynamic>{};
    if (data is Map<String, dynamic>) {
      json = data;
    }
    return PurpleZone(
      id: json['id'] as num?,
      name: json['name'] as String?,
      location: json['location'] as String?,
    );
  }
  final num? id;
  final String? name;
  final String? location;
}
