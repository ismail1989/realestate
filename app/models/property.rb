class Property < ApplicationRecord
	include Tire::Model::Search
  include Tire::Model::Callbacks
  serialize :facilities, JSON
  
  HOLDINGTYPES=['Appartment', 'Luxury-Flat', 'House-Villa', 'Lands', 'Other Holding']

  SPECIALTIES=['Balcony', 'Terace', 'Kids Playing area', 'BBQ area', 'Cloths cleaning services', 'Built in Kitchen Appliances', 'Built in Wardrobes', 'Central A/C & Heating', 'Central A/C', 'Concierge Service', 'Covered Parking', 'Open Area Parking', 'No Parking', 'Maid Service', 'Maids Room', 'Pets Allowed', 'Private Garden', 'Shared Garden', 'Private Gym', 'Shared Gym', 'Private Pool', 'Shared Pool', 'Security', 'View of Landmark', 'View of Water']
  
  CITY=['İstanbul',
        'Adana',
        'Adıyaman',
        'Afyonkarahisar',
        'Ağrı',
        'Aksaray',
        'Amasya',
        'Ankara',
        'Antalya',
        'Ardahan',
        'Artvin',
        'Aydın',
        'Balıkesir',
        'Bartın',
        'Batman',
        'Bayburt',
        'Bilecik',
        'Bingöl',
        'Bitlis',
        'Bolu',
        'Burdur',
        'Bursa',
        'Çanakkale',
        'Çankırı',
        'Çorum',
        'Denizli',
        'Diyarbakır',
        'Düzce',
        'Edirne',
        'Elazığ',
        'Erzincan',
        'Erzurum',
        'Eskişehir',
        'Gaziantep',
        'Giresun',
        'Gümüşhane',
        'Hakkari',
        'Hatay',
        'Iğdır',
        'Isparta',
        'İzmir',
        'Kahramanmaraş',
        'Karabük',
        'Karaman',
        'Kars',
        'Kastamonu',
        'Kayseri',
        'Kilis',
        'Kırıkkale',
        'Kırklareli',
        'Kırşehir',
        'Kocaeli',
        'Konya',
        'Kütahya',
        'Malatya',
        'Manisa',
        'Mardin',
        'Mersin',
        'Muğla',
        'Muş',
        'Nevşehir',
        'Niğde',
        'Ordu',
        'Osmaniye',
        'Rize',
        'Sakarya',
        'Samsun',
        'Şanlıurfa',
        'Siirt',
        'Sinop',
        'Şırnak',
        'Sivas',
        'Tekirdağ',
        'Tokat',
        'Trabzon',
        'Tunceli',
        'Uşak',
        'Van',
        'Yalova',
        'Yozgat',
        'Zonguldak']


  CITY_ARABIC={'اسطنبول' => 'İstanbul',
               'أضنة' => "Adana",
               'أديامان' => "Adıyaman",
               'أفيون شهير' => "Afyonkarahisar",
               'آغري' => "Ağrı",
               'أكسراي' => "Aksaray",
               'أماسيا' => "Amasya",
               'أنقرة' => "Ankara",
               'أنطاليا' => "Antalya",
               'أردهان' => "Ardahan",
               'أرتفين' => "Artvin",
               'آيدن' => "Aydın",
               'بالك إسير' => "Balıkesir",
               'بارتن' => "Bartın",
               'باتمان' => "Batman",
               'بايبورت' => "Bayburt",
               'بيلجيك' => "Bilecik",
               'بينغول' => "Bingöl",
               'بيتليس' => "Bitlis",
               'بولو' => "Bolu",
               'بوردر' => "Burdur",
               'بورصة' => "Bursa",
               'شاناكاله' => "Çanakkale",
               'شانكيري' => "Çankırı",
               'تشوروم' => "Çorum",
               'دينيزلي' => "Denizli",
               'ديار بكر' => "Diyarbakır",
               'دوزجه' => "Düzce",
               'إدرنه' => "Edirne",
               'إلازيغ' => "Elazığ",
               'إرزنجان' => "Erzincan",
               'إرضروم' => "Erzurum",
               'اسكي شهير' => "Eskişehir",
               'غازي عينتاب' => "Gaziantep",
               'غيرسن' => "Giresun",
               'غوموشهانه' => "Gümüşhane",
               'هاكاري' => "Hakkari",
               'هاتاي' => "Hatay",
               'إيدير' => "Iğdır",
               'إسبارطه' => "Isparta",
               'إزمير' => "İzmir",
               'كهرمان مرعش' => "Kahramanmaraş",
               'كارابوك' => "Karabük",
               'كارامان' => "Karaman",
               'كارس' => "Kars",
               'كاستامونه' => "Kastamonu",
               'قيصري' => "Kayseri",
               'كيليس' => "Kilis",
               'كرككاله' => "Kırıkkale",
               'كركلالي' => "Kırklareli",
               'كر شهير' => "Kırşehir",
               'كوجا علي' => "Kocaeli",
               'قونيا' => "Konya",
               'كوتاهيا' => "Kütahya",
               'مالاطيه' => "Malatya",
               'مانيسا' => "Manisa",
               'ماردين' => "Mardin",
               'مرسين' => "Mersin",
               'موغلا' => "Muğla",
               'موش' => "Muş",
               'نيو شهير' => "Nevşehir",
               'نيغده' => "Niğde",
               'أوردو' => "Ordu",
               'عصمانية' => "Osmaniye",
               'ريزه' => "Rize",
               'سكاريا' => "Sakarya",
               'سامسون' => "Samsun",
               'شانلي أورفا' => "Şanlıurfa",
               'سيرت' => "Siirt",
               'سينوب' => "Sinop",
               'شرناق' => "Şırnak",
               'سيواس' => "Sivas",
               'تيكيرداغ' => "Tekirdağ",
               'توكات' => "Tokat",
               'طرابزون' => "Trabzon",
               'تونجيلي' => "Tunceli",
               'أوشاك' => "Uşak",
               'فان' => "Van",
               'يلوا' => "Yalova",
               'يوزغات' => "Yozgat",
               'زنغولداك' => "Zonguldak"}
               
  mount_uploaders :gallery_photos, GalleryPhotosUploader
  mount_uploaders :floor_plan_photos, FloorPlanPhotosUploader
  mount_uploader :main_photo, MainPhotoUploader
  mount_uploader :cover_photo, CoverPhotoUploader
	serialize :gallery_photos, JSON
	serialize :floor_plan_photos, JSON

  # Validations
  validates_presence_of :city, :country, :province

  # Geocode
  geocoded_by :full_address
  after_validation :geocode
    reverse_geocoded_by :latitude, :longitude, :full_address => :full_address

  # Geocode vaidation
  after_validation -> {
    self.full_address = self.full_address
    geocode
  }, if: ->(obj){ obj.full_address.present? and obj.full_address != obj.full_address }

  after_validation :reverse_geocode, unless: ->(obj) { obj.full_address.present? },
                   if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }


	mapping do
    indexes :id, type: 'integer'
    indexes :country
    indexes :city
    indexes :province
    indexes :holding_type
    indexes :price, boost: 10
    indexes :created_at, type: 'date'
  end

  def full_address
    [city, country, province, address].compact.join(', ')
  end
  def force_encoding(params)
    self
  end
	def self.search(params)
  	tire.search(load: true) do
    query do
      boolean do
        must { string "Turkey" }
        must { string params[:city] } if params[:city].present?
        must { string params[:province] } if params[:province].present?
        must { string params[:holding_type] } if params[:holding_type].present?
        should { range :price, { gte: params[:price_range_min], lte: params[:price_range_max] } } if params[:price_range_min].present? && params[:price_range_max].present?
        end
      end
    end
	end
end