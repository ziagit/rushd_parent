import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fa', 'ps'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? faText = '',
    String? psText = '',
  }) =>
      [enText, faText, psText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Porfile
  {
    '9bewtqhz': {
      'en': 'Your Account',
      'fa': 'حساب شما',
      'ps': 'ستاسو حساب',
    },
    'gta64l61': {
      'en': 'General infomation',
      'fa': 'معلومات عمومی',
      'ps': 'عمومی معلومات',
    },
    'nymq3fwz': {
      'en': 'App Settings',
      'fa': 'تنظیمات برنامه',
      'ps': 'د اپلیکیشن تنظیمات',
    },
    '42a0jxm0': {
      'en': 'Setting',
      'fa': 'تنظیمات',
      'ps': 'ترتیب',
    },
    'jjejdyax': {
      'en': 'Support',
      'fa': 'پشتیبانی',
      'ps': 'ملاتړ',
    },
    '89fodkcq': {
      'en': 'Terms of Service',
      'fa': 'شرایط استفاده از خدمات',
      'ps': 'د خدمت شرطونه',
    },
  },
  // Login
  {
    'mdoz24k2': {
      'en': 'Welcome back',
      'fa': 'دوباره خوش آمدبد',
      'ps': 'بیرته پخیر راغلې',
    },
    'merzzdop': {
      'en': 'Please enter your account email and password ',
      'fa': 'لطفاً آدرس الکترونیکی و یا شماره تماس خود را وارد نماید',
      'ps': 'مهرباني وکړئ د خپل حساب بریښنالیک او پټنوم دننه کړئ',
    },
    'hwd198ej': {
      'en': 'Email',
      'fa': 'آدرس الکترونیکی',
      'ps': 'ایمیل',
    },
    'l5jj0c3s': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'qx3jwl5s': {
      'en': 'Password',
      'fa': 'کلمه عبور',
      'ps': 'رمز',
    },
    '5g9if4ka': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'hnr70s5t': {
      'en': 'Sign In',
      'fa': 'ورود',
      'ps': 'ننوزئ',
    },
    'w6505ynl': {
      'en': 'Forget your password? ',
      'fa': 'فراموشی گذر واژه',
      'ps': 'خپل پټنوم هیر کړی؟',
    },
    '3qutvtgz': {
      'en': ' Reset hear',
      'fa': 'فراموشی گذر واژه',
      'ps': 'اوریدل بیا تنظیم کړئ',
    },
    'x59d70gt': {
      'en': 'OR',
      'fa': 'و یا',
      'ps': 'یا',
    },
    'dl9wkkue': {
      'en': 'Continue with Facebook',
      'fa': 'ادامه با فیسبوک',
      'ps': 'د فیسبوک سره دوام ورکړئ',
    },
    'z1nq6d0v': {
      'en': 'Don\'t have an account? ',
      'fa': 'حساب ندارم',
      'ps': 'حساب نه لرئ؟',
    },
    'uq3tzo6s': {
      'en': ' Sign Up here',
      'fa': 'ایجاد حساب جدبد',
      'ps': 'دلته لاسلیک وکړئ',
    },
    'g5l2vhpo': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // CreateAccount
  {
    'kxt7i5mc': {
      'en': 'Create an account',
      'fa': 'ایجاد حساب ',
      'ps': 'ګڼون پرانیستل',
    },
    '6tbcc1o9': {
      'en': 'Let\'s get started by filling out the form below.',
      'fa': 'بیایید با پر کردن فرم زیر شروع کنیم.',
      'ps': 'راځئ چې د لاندې فارم په ډکولو سره پیل وکړو.',
    },
    'jaxiyjhu': {
      'en': 'Email or phone  number',
      'fa': 'آدرس الکترونیکی و یا شماره مبایل',
      'ps': 'بریښنالیک یا تلیفون شمیره',
    },
    '2uvzcesu': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'aedup24i': {
      'en': 'Password',
      'fa': 'کلمه عبور',
      'ps': 'رمز',
    },
    '0lapjl3g': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '5dn97fok': {
      'en': 'Confirm Password',
      'fa': 'رمز عبور را تایید کنید',
      'ps': 'پاسورډ تایید کړه',
    },
    'bdr78ce6': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    't2m4fdes': {
      'en': 'Create Account',
      'fa': 'ایجاد حساب کاربری',
      'ps': 'ګڼون جوړول',
    },
    'po4vdwsf': {
      'en': 'Already have an account? ',
      'fa': 'از قبل حساب کاربری دارید؟',
      'ps': 'ایا دمخه حساب لرئ؟',
    },
    'xpfs6ahp': {
      'en': 'Sign In here',
      'fa': 'اینجا وارد شوید',
      'ps': 'دلته ننوتل',
    },
    'n35xxkiu': {
      'en': 'Home',
      'fa': 'صفحه اصلی ',
      'ps': 'اصلي پاڼه',
    },
  },
  // ForgetPassword
  {
    'nrqr0hin': {
      'en': 'What is your email',
      'fa': 'آدرس الکترونیکی شما ',
      'ps': 'ستاسو برېښلیک څه دی',
    },
    'oketstop': {
      'en': 'Please enter the email you used to register',
      'fa': 'لطفا ایمیلی را که برای ثبت نام استفاده کرده اید وارد کنید',
      'ps':
          'مهرباني وکړئ هغه بریښنالیک دننه کړئ چې تاسو یې د راجستر کولو لپاره کارولی و',
    },
    'phgk3nml': {
      'en': 'Email',
      'fa': 'آدرس الکترونیکی',
      'ps': 'ایمیل',
    },
    'owt1g0se': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'rzi3y43n': {
      'en': 'Send reset code',
      'fa': 'ارسال پیامک',
      'ps': 'د ری سیٹ کوډ واستوئ',
    },
    'w16dp99w': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // VerifiationCode
  {
    'lhi55xcb': {
      'en': 'What is the code',
      'fa': 'کد چیست',
      'ps': 'کوډ څه شی دی',
    },
    'h9wih570': {
      'en': 'Enter the code we sent to your email',
      'fa': 'کدی را که به ایمیل شما فرستادیم وارد کنید',
      'ps': 'هغه کوډ دننه کړئ چې موږ ستاسو بریښنالیک ته لیږلی',
    },
    'vz6pjof6': {
      'en': 'Verification code',
      'fa': 'کد تایید',
      'ps': 'د تایید کوډ',
    },
    'kg4ojji6': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'kv3jbeu8': {
      'en': 'Submit',
      'fa': 'ارسال',
      'ps': 'سپارل',
    },
    '8ojakxzd': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // NewPassword
  {
    'r9svenfi': {
      'en': 'New password',
      'fa': 'رمز عبور جدید',
      'ps': 'نوئ پټ نوم',
    },
    'z7ifw5y4': {
      'en': 'Please enter your new password to continue',
      'fa': 'لطفا رمز عبور جدید خود را برای ادامه وارد کنید',
      'ps': 'نوی پټنوم مهرباني وکړئ د دوام لپاره خپل نوی پټنوم دننه کړئ',
    },
    'hfhoet7y': {
      'en': 'New password',
      'fa': 'رمز عبور جدید',
      'ps': 'نوئ پټ نوم',
    },
    'avwtjavq': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'pa2rer3f': {
      'en': 'Password confirmation',
      'fa': 'تایید رمز عبور',
      'ps': 'د پټنوم تایید',
    },
    'fzktxk70': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '2z1jsu3n': {
      'en': 'Submit',
      'fa': 'ارسال',
      'ps': 'سپارل',
    },
    'g8en4i7j': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Activities
  {
    'qtg2elqe': {
      'en': 'Last 30 Days',
      'fa': '30 روز قبل',
      'ps': '30 ورځې وړاندې',
    },
    'q1kb3es1': {
      'en': 'Avg. Grade',
      'fa': 'اوسط نمرات',
      'ps': 'اوسط نمرې',
    },
    'mb57k8mn': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Attendance
  {
    'cfn1orur': {
      'en': 'Last 30 Days',
      'fa': '30 روز قبل',
      'ps': '30 ورځې وړاندې',
    },
    '8s7ezxug': {
      'en': 'Avg. Grade',
      'fa': 'اوسط نمرات',
      'ps': 'اوسط نمرې',
    },
    'bb7lgqt6': {
      'en': 'Months',
      'fa': 'ماه ها',
      'ps': 'میاشتې',
    },
    'octkgyzm': {
      'en': 'Attendance',
      'fa': 'حاضری',
      'ps': 'حاضری',
    },
    'yynle8pm': {
      'en': 'Sorted by most recent',
      'fa': 'مرتب شده بر اساس جدیدترین',
      'ps': 'د وروستي لخوا ترتیب شوی',
    },
    'rsphc2w5': {
      'en': 'November 2023',
      'fa': 'نوامبر 2023',
      'ps': 'نوامبر 2023',
    },
    '4lkogrhj': {
      'en': '17',
      'fa': '17',
      'ps': '17',
    },
    'rgnz4mck': {
      'en': 'Nov',
      'fa': 'نوامبر',
      'ps': 'نوامبر',
    },
    'n4j6269c': {
      'en': 'Present',
      'fa': 'حاضر',
      'ps': 'حاضر',
    },
    'tcirphe0': {
      'en': 'Successfully submitted physic\'s \nassessment.',
      'fa': 'فیزیک با موفقیت ارسال شد\nارزیابی',
      'ps': 'فزیک په بریالیتوب سره سپارل شوی\nارزونه',
    },
    'q1unigy5': {
      'en': 'Teacher name',
      'fa': 'نام معلم',
      'ps': 'د ښوونکي نوم',
    },
    'ud33dw3c': {
      'en': '16',
      'fa': '16',
      'ps': '16',
    },
    'lvf51mxj': {
      'en': 'Nov',
      'fa': 'نوامبر',
      'ps': 'نوامبر',
    },
    'gzt3jvzp': {
      'en': 'Absent',
      'fa': 'غیر حاضر',
      'ps': 'غیر حاضرۍ',
    },
    'bsd9llc5': {
      'en': 'This student did not submit his \nassessment for chemestry.',
      'fa': 'این دانش آموز خود را ارسال نکرد\nارزیابی برای شیمی',
      'ps': 'دې زده کوونکي خپل اسناد نه دي سپارلي\nد کیمیا لپاره دنده.',
    },
    'r2uaeogd': {
      'en': 'Teacher name',
      'fa': 'نام معلم',
      'ps': 'د ښوونکي نوم',
    },
    '55l87qxd': {
      'en': 'October 2023',
      'fa': 'اکتبر 2023',
      'ps': 'اکتبر 2023',
    },
    'a9iczewv': {
      'en': 'September 2023',
      'fa': 'سپتمبر 2023',
      'ps': 'سپتمبر 2023',
    },
    '0wpxc5vn': {
      'en': 'August 2023',
      'fa': 'آگست 2023',
      'ps': 'آگست 2023',
    },
    'lrk6zmzy': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Messaging
  {
    'aftcl6v4': {
      'en': 'Search lecture...',
      'fa': 'جستجوی لکچر',
      'ps': 'جستجوی لکچر',
    },
    'g1bdrcmu': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Messages
  {
    '6vaircl9': {
      'en': 'Hello there',
      'fa': 'سلام',
      'ps': 'سلام',
    },
    'f3lsqw51': {
      'en': 'Hello, How can we help you today?',
      'fa': 'سلام، امروز چگونه می توانیم به شما کمک کنیم؟',
      'ps': 'سلام، نن ورځ موږ څنګه ستاسو سره مرسته کولی شو؟',
    },
    'lh1yxwih': {
      'en': 'Type your message...',
      'fa': 'پیام خود را تایپ کنید...',
      'ps': 'خپل پیغام ټایپ کړئ ...',
    },
    'oqoxx7co': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Courses
  {
    'j3cpxmoq': {
      'en': 'All courses',
      'fa': 'همه کورس ها',
      'ps': 'ټول کورسونه',
    },
    'tmceofox': {
      'en': 'For You',
      'fa': 'برای شما',
      'ps': 'ستاسو لپاره',
    },
    'b38krma3': {
      'en': 'Computer',
      'fa': 'کمپیوتر ',
      'ps': 'کمپیوتر',
    },
    'x8dtjlm4': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انگلیسی',
    },
    'uxbwykb7': {
      'en': 'Math',
      'fa': 'ریاضی',
      'ps': 'ریاضی',
    },
    '1ptmb7e5': {
      'en': 'Ai',
      'fa': 'هوش مصنوعی',
      'ps': 'مصنوعي استخبارات',
    },
    'o0alof9a': {
      'en': 'Echonomic',
      'fa': 'اقتصاد',
      'ps': 'اقتصاد',
    },
    '37xk18tb': {
      'en': 'For You',
      'fa': 'برای شما',
      'ps': 'ستاسو لپاره',
    },
    '4pobgvti': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انگلیسی',
    },
    'gkl9edap': {
      'en': 'Arabic',
      'fa': 'عربی',
      'ps': 'عربی',
    },
    '6rm88unb': {
      'en': 'Computer',
      'fa': 'کمپیوتر',
      'ps': 'کمپیوتر',
    },
    'g0m3soca': {
      'en': 'Physics',
      'fa': 'فزیک',
      'ps': 'فزیک',
    },
    '5cjtvbq2': {
      'en': 'Ai',
      'fa': 'هوش مصنوعی',
      'ps': 'مصنوعي استخبارات',
    },
    'il112olb': {
      'en': 'Graphics',
      'fa': 'گرافیک',
      'ps': 'ګرافیک',
    },
    '6lo09703': {
      'en': 'Photoshop',
      'fa': 'فوتوشاپ',
      'ps': 'فوتوشاپ',
    },
    'ln7gmsoj': {
      'en': 'Web',
      'fa': 'ویب',
      'ps': 'ویب',
    },
    '0dzudzu8': {
      'en': 'Enrolled',
      'fa': 'ثبت نام شده',
      'ps': 'ثبت شوی',
    },
    'dtw1gy6w': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انگلیسی',
    },
    'e1w5ytvm': {
      'en': 'Arabic',
      'fa': 'عربی',
      'ps': 'عربی',
    },
    '9bk53r5l': {
      'en': 'Computer',
      'fa': 'کمپیوتر',
      'ps': 'کمپیوتر',
    },
    'pgl67yn6': {
      'en': 'Physics',
      'fa': 'فزیک',
      'ps': 'فزیک',
    },
    'pxf3p4i9': {
      'en': 'Ai',
      'fa': 'هوش مصنوعی',
      'ps': 'مصنوعي استخبارات',
    },
    '5o6rwt0u': {
      'en': 'Graphics',
      'fa': 'گرافیک',
      'ps': 'ګرافیک',
    },
    '5o69x8il': {
      'en': 'Photoshop',
      'fa': 'فوتوشاپ',
      'ps': 'فوتوشاپ',
    },
    '46y2jdfu': {
      'en': 'Web',
      'fa': 'ویب',
      'ps': 'ویب',
    },
    'oozccshr': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Course
  {
    'n7r8wtd6': {
      'en': 'Search lecture...',
      'fa': 'جستجوی لکچر',
      'ps': 'جستجوی لکچر',
    },
    'bqzk6dh9': {
      'en': 'Introduction to computer',
      'fa': 'مقدمه ای بر کامپیوتر',
      'ps': 'د کمپیوټر پیژندنه',
    },
    's9oqc85q': {
      'en': 'Jackson Hewiit',
      'fa': 'جک سن',
      'ps': 'جیکسن هیویټ',
    },
    'mvkko023': {
      'en': '24',
      'fa': '24',
      'ps': '24',
    },
    '5ggsgf2i': {
      'en': '12h',
      'fa': '12 ساعت',
      'ps': '12 ساعته',
    },
    '6xg4t3k4': {
      'en': 'Read Now',
      'fa': 'الا بخوان',
      'ps': 'ولولئ',
    },
    'ghehvyhb': {
      'en': 'Computer archteture and more about',
      'fa': 'معماری کامپیوتر و بیشتر در مورد',
      'ps': 'د کمپیوټر جوړښت او نور په اړه',
    },
    'o1ja2s5z': {
      'en': 'Jackson Hewiit',
      'fa': 'جک سن',
      'ps': 'جیکسن هیویټ',
    },
    'yyluq9kn': {
      'en': '24',
      'fa': '24',
      'ps': '24',
    },
    '7uz54sac': {
      'en': '12h',
      'fa': '12 ساعت',
      'ps': '12 ساعته',
    },
    'w3t5jyg8': {
      'en': 'Read Now',
      'fa': 'آلا بخوان',
      'ps': 'ولولئ',
    },
    '7zdz3s1v': {
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
      'fa': 'HSBC در حال بازگشت به وام های مصرف کننده در ایالات متحده است.',
      'ps': 'HSBC په متحده ایالاتو کې د مصرف کونکو پورونو ته راستنیږي.',
    },
    'gv4q3gtz': {
      'en': 'Jackson Hewiit',
      'fa': 'جک سن',
      'ps': 'جیکسن هیویټ',
    },
    '3yhetcr8': {
      'en': '24',
      'fa': '24',
      'ps': '24',
    },
    '5pd6q7dw': {
      'en': '12h',
      'fa': '12 ساعت',
      'ps': '12 ساعته',
    },
    '3i7z2n7h': {
      'en': 'Read Now',
      'fa': 'آلا بخوان',
      'ps': 'ولولئ',
    },
    'u57crnt6': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // ReadCourse
  {
    'qolfjaj4': {
      'en': 'Lecture 1, computer basics',
      'fa': 'لکچر 1، اساسات کمپیوتر',
      'ps': 'لکچر 1، اساسات کمپیوتر',
    },
    'zcagqy09': {
      'en': '3.1k Members',
      'fa': '3.16k عضو',
      'ps': '3.16k غړي',
    },
    '9y7eaygt': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'fa':
          'مراقبت از بیمار مهم است که بیمار دنبالش باشد، اما این اتفاق در زمانی می افتد که کار و درد زیاد است. برای رسیدن به کوچکترین جزئیات، هیچ کس نباید هیچ نوع کاری را تمرین کند، مگر اینکه از آن بهره ای ببرد.',
      'ps':
          'دا اړینه ده چې ناروغ ته پاملرنه وشي، د ناروغ تعقیب شي، مګر دا به په داسې وخت کې پیښ شي چې ډیر کار او درد وي. د دې لپاره چې لږې توضیحاتو ته راشو ، هیڅوک باید هیڅ ډول کار ونه کړي پرته لدې چې هغه له دې څخه ګټه ترلاسه کړي.',
    },
    'ukcu1fnn': {
      'en': 'Add your homework',
      'fa': 'کارخانگی خود را اضافه کنید',
      'ps': 'خپل فابریکه اضافه کړئ',
    },
    'de959d0x': {
      'en': 'Take assessment',
      'fa': 'ارزیابی را انجام دهید',
      'ps': 'ارزونه',
    },
    'ivkvkwtq': {
      'en': '3',
      'fa': '3',
      'ps': '3',
    },
    'wdora2c1': {
      'en': 'likes',
      'fa': 'دوست دارد',
      'ps': 'خوښوي',
    },
    'dyu1xdl0': {
      'en': '8',
      'fa': '8',
      'ps': '8',
    },
    'am0wsfk3': {
      'en': 'Comments',
      'fa': 'نظرات',
      'ps': 'تبصرې',
    },
    'o8s8h3an': {
      'en': 'Type your comments here...',
      'fa': 'نظرات خود را اینجا تایپ کنید...',
      'ps': 'خپل نظرونه دلته ولیکئ...',
    },
    'are6kvc8': {
      'en': 'Submit',
      'fa': 'ارسال',
      'ps': 'سپارل',
    },
    '3mrx8ha8': {
      'en': 'Randy Alcorn',
      'fa': 'رندی',
      'ps': 'رندی',
    },
    '5yq90nn9': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'fa':
          'من واقعاً در مورد این بخش در اینجا مطمئن نیستم، فکر می کنم شما باید کار جالبی انجام دهید!',
      'ps':
          'زه دلته د دې برخې په اړه واقعیا ډاډه نه یم زه فکر کوم چې تاسو باید یو څه ښه وکړئ!',
    },
    'bpwr70s8': {
      'en': 'a min ago',
      'fa': 'یک دقیقه قبل',
      'ps': 'یوه دقیقه مخکې',
    },
    'g0pkyhoz': {
      'en': 'Sandra Smith',
      'fa': 'سندرا',
      'ps': 'سندرا',
    },
    'ok8f9wn1': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'fa':
          'من واقعاً در مورد این بخش در اینجا مطمئن نیستم، فکر می کنم شما باید کار جالبی انجام دهید!',
      'ps':
          'زه دلته د دې برخې په اړه واقعیا ډاډه نه یم زه فکر کوم چې تاسو باید یو څه ښه وکړئ!',
    },
    'bih6y80o': {
      'en': 'a min ago',
      'fa': 'یک دقیقه قبل',
      'ps': 'یوه دقیقه مخکې',
    },
    'e6lx14hy': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Library
  {
    'k9yv1gxp': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // ReadBook
  {
    'x4iuaehw': {
      'en': 'The light of stone',
      'fa': 'نور سنگ',
      'ps': 'د ډبرې رڼا',
    },
    'g8k7hzm5': {
      'en': 'Description',
      'fa': 'توضیحات',
      'ps': 'تفصیل',
    },
    'pcdw0s0e': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'دلته د دندې توضیحات ایا دا واقعیا اوږد دی او شاید پای ته ورسیږي؟ او دا دوه کرښې ته ځي.',
    },
    'j73ofnub': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'qvj47dq8': {
      'en': '12-02-2024',
      'fa': '12-02-2024',
      'ps': '12-02-2024',
    },
    'yd0opnmv': {
      'en': 'Author',
      'fa': 'نویسنده',
      'ps': 'لیکوال',
    },
    'lrxrs0rj': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Welcome
  {
    'uyqy9xc3': {
      'en': 'RUSHD PARENT',
      'fa': 'والدین رشد',
      'ps': 'وده کونکي والدین',
    },
    '1q5bpg4x': {
      'en': 'English',
      'fa': 'English',
      'ps': 'English',
    },
    'neeze0hb': {
      'en': 'فارسی',
      'fa': 'فارسی',
      'ps': 'فارسی',
    },
    'ondncyzo': {
      'en': 'پښتو',
      'fa': 'پښتو',
      'ps': 'پښتو',
    },
    '6mqvx0pz': {
      'en': 'ACCURATE',
      'fa': 'دقیق',
      'ps': 'دقیق',
    },
    'bu960qb5': {
      'en': 'EASY',
      'fa': 'آسان',
      'ps': 'اسانه',
    },
    'mt8v44nf': {
      'en': 'Your Journey Begins',
      'fa': 'سفر شما آغاز می شود',
      'ps': 'ستاسو سفر پیل کیږي',
    },
    'cmcay96u': {
      'en': 'Sign up below in order to get started!',
      'fa': 'برای شروع در زیر ثبت نام کنید!',
      'ps': 'د پیل کولو لپاره لاندې لاسلیک وکړئ!',
    },
    '357y0c97': {
      'en': 'Get Started',
      'fa': 'شروع کنید',
      'ps': 'پیل',
    },
    'h7qrknxl': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // AddProfile
  {
    '6wmnqwfe': {
      'en': 'Add profile details',
      'fa': 'افزودن جزئیات نمایه',
      'ps': 'د پروفایل توضیحات اضافه کړئ',
    },
    'x3sfqpxb': {
      'en': 'First name',
      'fa': 'نام',
      'ps': 'نوم',
    },
    'cj0mc4r0': {
      'en': 'Last name',
      'fa': 'تخلص',
      'ps': 'تخلص',
    },
    'pewqvkee': {
      'en': 'Male',
      'fa': 'مرد',
      'ps': 'سړی',
    },
    '6uhbx03t': {
      'en': 'Female',
      'fa': 'زن',
      'ps': 'ښځینه',
    },
    'lu25m515': {
      'en': 'Gender',
      'fa': 'جنسیت',
      'ps': 'جندر',
    },
    '1zu5ndvl': {
      'en': 'Search for an item...',
      'fa': 'جستجو برای یک مورد ...',
      'ps': 'د یو شی په لټه کې...',
    },
    'lsmnb6jt': {
      'en': 'Job',
      'fa': 'وظیفه',
      'ps': 'وظیفه',
    },
    '1xzljnh6': {
      'en': 'Submit',
      'fa': 'ارسال',
      'ps': 'سپارل',
    },
    'ixp0pmeh': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Children
  {
    'oficxeg7': {
      'en': 'Children',
      'fa': 'فرزندان',
      'ps': 'ماشومان',
    },
    '2k1l7h70': {
      'en': 'Hekmatullah',
      'fa': 'حکمت الله',
      'ps': 'حکمت الله',
    },
    '86hf8vsg': {
      'en': 'Class; ',
      'fa': 'صنف:',
      'ps': 'ټولګي:',
    },
    'pkyt6jfv': {
      'en': '10',
      'fa': '10',
      'ps': '10',
    },
    'k8a28idt': {
      'en': 'Group: ',
      'fa': 'گروه:',
      'ps': 'ډله:',
    },
    's9gzc5xc': {
      'en': 'A',
      'fa': 'الف',
      'ps': 'الف',
    },
    '83gccjnc': {
      'en': 'Activities',
      'fa': 'فعالیت ها',
      'ps': 'فعالیتونه',
    },
    'srhfhh8u': {
      'en': 'Homeworks',
      'fa': 'کارخانگی',
      'ps': 'فابریکه',
    },
    '1uhjsp8k': {
      'en': 'Attendance',
      'fa': 'حاضری',
      'ps': 'حاضری',
    },
    'dypprk5s': {
      'en': 'Classes',
      'fa': 'صنوف',
      'ps': 'ټولګي',
    },
    '84tfobrc': {
      'en': 'Courses',
      'fa': 'کورسها',
      'ps': 'کورسونه',
    },
    'm8tmq5fy': {
      'en': 'Sahar',
      'fa': 'سحر',
      'ps': 'سحر',
    },
    'utbx6hss': {
      'en': 'Class; ',
      'fa': 'صنف:',
      'ps': 'ټولګي:',
    },
    '3z98xq4q': {
      'en': '12',
      'fa': '12',
      'ps': '12',
    },
    't5sntbdj': {
      'en': 'Group: ',
      'fa': 'گروه:',
      'ps': 'گروه:',
    },
    '6vmev9uq': {
      'en': 'A',
      'fa': 'الف',
      'ps': 'الف',
    },
    'bv9bp5q5': {
      'en': 'Activities',
      'fa': 'فعالیت ها',
      'ps': 'فعالیتونه',
    },
    '4abe1q92': {
      'en': 'Homeworks',
      'fa': 'کارخانگی',
      'ps': 'فابریکه',
    },
    '1v50qcfe': {
      'en': 'Attendance',
      'fa': 'حاضری',
      'ps': 'حاضری',
    },
    '8kp6owwy': {
      'en': 'Classes',
      'fa': 'صنوف',
      'ps': 'ټولګي',
    },
    'ub1rac76': {
      'en': 'Courses',
      'fa': 'کورس ها',
      'ps': 'کورسونه',
    },
    'bi3o2klc': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Homework
  {
    '5aaa6ha6': {
      'en': 'Last 30 Days',
      'fa': '30 روز قبل',
      'ps': '30 ورځې وړاندې',
    },
    'a0d5rw2k': {
      'en': 'Avg. Grade',
      'fa': 'اوسط نمرات',
      'ps': 'اوسط نمرې',
    },
    'tsxc93fg': {
      'en': 'All',
      'fa': 'همه',
      'ps': 'ټول',
    },
    'cxjuq0b8': {
      'en': 'Physics',
      'fa': 'فزیک',
      'ps': 'فزیک',
    },
    'u4kfghz3': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انگلیسی',
    },
    'oak1kp1e': {
      'en': 'Math',
      'fa': 'ریاضی',
      'ps': 'ریاضی',
    },
    '66qu9v38': {
      'en': 'Geology',
      'fa': 'جیولوژی',
      'ps': 'جیولوژی',
    },
    '77ss84v5': {
      'en': 'Dari',
      'fa': 'دری',
      'ps': 'دری',
    },
    'mzt0tjeq': {
      'en': 'All',
      'fa': 'همه',
      'ps': 'ټول',
    },
    'xmeppga6': {
      'en': 'Homeworks',
      'fa': 'کارخانگی',
      'ps': 'فابریکه',
    },
    '66a2ka6t': {
      'en': 'A summary of homeworks and assessments',
      'fa': 'خلاصه ای از کارخانگی و ارزیابی ها',
      'ps': 'د فابریکې او ارزونو لنډیز',
    },
    'u94ief6z': {
      'en': 'Homework completed',
      'fa': 'کارخانگی تکمیل شد',
      'ps': 'د فابریکې او ارزونو لنډیز',
    },
    'vpyxec8h': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح کار در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps': 'د کور کار بشپړ شو',
    },
    'f2zem3xc': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    '5iku7q44': {
      'en': '12-02-2024',
      'fa': '12-02-2024',
      'ps': '12-02-2024',
    },
    'zcgn8zxy': {
      'en': 'Assessment passed',
      'fa': 'ارزیابی به تصویب رسید',
      'ps': 'ارزونه تصویب شوه',
    },
    'rxkx2hu4': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح کار در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې تفصیل دلته دا واقعیا اوږد دی او شاید پای ته ورسیږي؟ او دا دوه کرښې ته ځي.',
    },
    'eb3m3l95': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'r250a5yn': {
      'en': '10-12-2023',
      'fa': '10-12-2023',
      'ps': '10-12-2023',
    },
    'aifzadt4': {
      'en': 'Homework not submitted',
      'fa': 'کارخانگی ارسال نشد',
      'ps': 'کورنی کار ندی سپارل شوی',
    },
    '6e41uteo': {
      'en': 'You did not submit your homework for physics subject. ',
      'fa': 'شما کارخانگی خود را برای درس فیزیک ارسال نکردید.',
      'ps': 'تاسو خپل کورنی کار د فزیک مضمون لپاره ندی سپارلی.',
    },
    'll7bszct': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'bsfylt5c': {
      'en': '10-01-2023',
      'fa': '10-01-2023',
      'ps': '10-01-2023',
    },
    'tpc69n50': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Dashboard
  {
    'nf1p58ur': {
      'en': 'Now you have about 999+ books ',
      'fa': 'اکنون حدود 999+ کتاب دارید',
      'ps': 'اوس تاسو شاوخوا 999+ کتابونه لرئ',
    },
    'y299r6st': {
      'en': '1402/09/09 12:23 pm',
      'fa': '1402/09/09 12:23 ب ظ',
      'ps': '1402/09/09 12:23 ب ظ',
    },
    'xthkx64b': {
      'en': 'Rushd news',
      'fa': 'اخبار رشد',
      'ps': 'رشد خبرونه',
    },
    'ls3tiqzg': {
      'en': 'Najma Shmas',
      'fa': 'نجما شمس',
      'ps': 'نجما شمس',
    },
    'odzgqvkd': {
      'en': 'Student of the week',
      'fa': 'شاگرد هفته',
      'ps': 'د اونۍ زده کوونکی',
    },
    '2fw487r6': {
      'en': 'Library',
      'fa': 'کتابخانه',
      'ps': 'کتابتون',
    },
    '88jt171b': {
      'en': 'Reviews',
      'fa': 'ارزیابی ها',
      'ps': 'امتحانونه',
    },
    'pgbqmuzo': {
      'en': 'Courses',
      'fa': 'کورسها',
      'ps': 'کورسونه',
    },
    'gotop351': {
      'en': 'Notice bourd',
      'fa': 'بورد اعلانات',
      'ps': 'د اعلاناتو بورډ',
    },
    '83zsb40j': {
      'en': 'My activity',
      'fa': 'فعالیت ها من',
      'ps': 'زما فعالیتونه',
    },
    'ckl9kagc': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // NoticeBoard
  {
    'c63ij1wm': {
      'en': 'Holyday announcement',
      'fa': '',
      'ps': '',
    },
    'rdlmc8xj': {
      'en': 'No comments yet! Add one to start the conversation.',
      'fa': '',
      'ps': '',
    },
    'p795xnfr': {
      'en': 'Read more',
      'fa': '',
      'ps': '',
    },
    'eo8n0uts': {
      'en': 'Final year exam',
      'fa': '',
      'ps': '',
    },
    'xnlhhs6f': {
      'en': 'No comments yet! Add one to start the conversation.',
      'fa': '',
      'ps': '',
    },
    'i2liv5wr': {
      'en': 'Read more',
      'fa': '',
      'ps': '',
    },
    'uhrtnznq': {
      'en': 'Final year exam',
      'fa': '',
      'ps': '',
    },
    'y4ywq2jn': {
      'en': 'No comments yet! Add one to start the conversation.',
      'fa': '',
      'ps': '',
    },
    'iozyfl4s': {
      'en': 'Read more',
      'fa': '',
      'ps': '',
    },
    'cx4t6xgu': {
      'en': 'Final year exam',
      'fa': '',
      'ps': '',
    },
    'naxjhf02': {
      'en': 'No comments yet! Add one to start the conversation.',
      'fa': '',
      'ps': '',
    },
    'ognkk7so': {
      'en': 'Read more',
      'fa': '',
      'ps': '',
    },
    'l47sd68h': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // HelpCenter
  {
    'wf0kv6mm': {
      'en': 'Help center',
      'fa': 'مرکز خدمات',
      'ps': 'د مرستې مرکز',
    },
    '6gzbdlbc': {
      'en':
          'To find call center logos relevant to your business \nenter your business  name - We\'ll automa',
      'fa':
          'برای پیدا کردن آرم مرکز تماس مرتبط با کسب و کار شما\nنام کسب و کار خود را وارد کنید - ما خودکار می شویم',
      'ps':
          'ستاسو د سوداګرۍ پورې اړوند د تماس مرکز لوګو موندلو لپاره\nخپل د سوداګرۍ نوم ولیکئ - موږ به اتوماتیک کړو',
    },
    'thlhifi8': {
      'en': 'What is Rushd?',
      'fa': 'رشد چیست؟',
      'ps': 'رشد څه دي؟',
    },
    '3rzrnoaj': {
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'fa': 'مشتری بسیار مهم است، مشتری دنبال خواهد شد...',
      'ps': 'پیرودونکی خورا مهم دی، پیرودونکي به تعقیب کړي ...',
    },
    'b0uk0a9r': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fa':
          'مراقبت از بیمار مهم است که بیمار دنبالش باشد، اما این اتفاق در زمانی می افتد که کار و درد زیاد است. برای رسیدن به کوچکترین جزئیات، هیچ کس نباید هیچ نوع کاری را تمرین کند، مگر اینکه از آن بهره ای ببرد. در توبیخ در لذتی که می خواهد مویی از درد باشد عصبانی نشو به این امید که پرورشی نباشد. تا شهوت کور نشوند، بیرون نمی آیند؛ مقصرند که تکالیف خود را رها می کنند و دلها، یعنی زحماتشان را نرم می کنند.',
      'ps':
          'د ناروغ پاملرنه د ناروغ تعقیب لپاره مهمه ده، مګر دا په داسې وخت کې پیښیږي کله چې کار او درد لوړ وي. هیڅوک باید هر ډول کار ترسره نه کړي، تر ټولو کوچنیو توضیحاتو پورې، پرته له دې چې هغه یې ګټه پورته کړي. په هغه خوښۍ کې په ملامت کې مه غوسه کېږه چې د درد ویښتان غواړي په دې هیله چې دا به ونه کرل شي. تر څو چې دوی په شهوت ړانده شوي نه وي، دوی بهر نه راوځي. دوی مجرم دي چې خپل دندې پریږدي او د دوی زړونه نرم کړي، یعنی د دوی هڅې.',
    },
    'g1901ip0': {
      'en': 'How students enrole themself?',
      'fa': 'دانش آموزان چگونه خود را ثبت نام می کنند؟',
      'ps': 'زده کوونکي څنګه ځان ثبتوي؟',
    },
    '1zzh6def': {
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'fa': 'مشتری بسیار مهم است، مشتری دنبال خواهد شد...',
      'ps': 'پیرودونکی خورا مهم دی، پیرودونکي به تعقیب کړي ...',
    },
    'y4r1jreg': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fa':
          'مراقبت از بیمار مهم است که بیمار دنبالش باشد، اما این اتفاق در زمانی می افتد که کار و درد زیاد است. برای رسیدن به کوچکترین جزئیات، هیچ کس نباید هیچ نوع کاری را تمرین کند، مگر اینکه از آن بهره ای ببرد. در توبیخ در لذتی که می خواهد مویی از درد باشد عصبانی نشو به این امید که پرورشی نباشد. تا شهوت کور نشوند، بیرون نمی آیند؛ مقصرند که تکالیف خود را رها می کنند و دلها، یعنی زحماتشان را نرم می کنند.',
      'ps':
          'د ناروغ پاملرنه د ناروغ تعقیب لپاره مهمه ده، مګر دا په داسې وخت کې پیښیږي کله چې کار او درد لوړ وي. هیڅوک باید هر ډول کار ترسره نه کړي، تر ټولو کوچنیو توضیحاتو پورې، پرته له دې چې هغه یې ګټه پورته کړي. په هغه خوښۍ کې په ملامت کې مه غوسه کېږه چې د درد ویښتان غواړي په دې هیله چې دا به ونه کرل شي. تر څو چې دوی په شهوت ړانده شوي نه وي، دوی بهر نه راوځي. دوی مجرم دي چې خپل دندې پریږدي او د دوی زړونه نرم کړي، یعنی د دوی هڅې.',
    },
    '4pfft654': {
      'en': 'How to submit my homeworks?',
      'fa': 'چگونه تکالیف خود را ارسال کنم؟',
      'ps': 'څنګه خپل کورنی کارونه وسپارم؟',
    },
    '3wg0ub2v': {
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'fa': 'مشتری بسیار مهم است، مشتری دنبال خواهد شد...',
      'ps': 'پیرودونکی خورا مهم دی، پیرودونکي به تعقیب کړي ...',
    },
    'ojyjonio': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fa':
          'مراقبت از بیمار مهم است که بیمار دنبالش باشد، اما این اتفاق در زمانی می افتد که کار و درد زیاد است. برای رسیدن به کوچکترین جزئیات، هیچ کس نباید هیچ نوع کاری را تمرین کند، مگر اینکه از آن بهره ای ببرد. در توبیخ در لذتی که می خواهد مویی از درد باشد عصبانی نشو به این امید که پرورشی نباشد. تا شهوت کور نشوند، بیرون نمی آیند؛ مقصرند که تکالیف خود را رها می کنند و دلها، یعنی زحماتشان را نرم می کنند.',
      'ps':
          'د ناروغ پاملرنه د ناروغ تعقیب لپاره مهمه ده، مګر دا په داسې وخت کې پیښیږي کله چې کار او درد لوړ وي. هیڅوک باید هر ډول کار ترسره نه کړي، تر ټولو کوچنیو توضیحاتو پورې، پرته له دې چې هغه یې ګټه پورته کړي. په هغه خوښۍ کې په ملامت کې مه غوسه کېږه چې د درد ویښتان غواړي په دې هیله چې دا به ونه کرل شي. تر څو چې دوی په شهوت ړانده شوي نه وي، دوی بهر نه راوځي. دوی مجرم دي چې خپل دندې پریږدي او د دوی زړونه نرم کړي، یعنی د دوی هڅې.\n',
    },
    '666zuuc1': {
      'en': 'How to contact a teacher?',
      'fa': 'چگونه با معلم تماس بگیریم؟',
      'ps': 'د ښوونکي سره څنګه اړیکه ونیسئ؟',
    },
    'gq5gantl': {
      'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing...',
      'fa': 'مشتری بسیار مهم است، مشتری دنبال خواهد شد...',
      'ps': 'پیرودونکی خورا مهم دی، پیرودونکي به تعقیب کړي ...',
    },
    'laa2b6un': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fa':
          'مراقبت از بیمار مهم است که بیمار دنبالش باشد، اما این اتفاق در زمانی می افتد که کار و درد زیاد است. برای رسیدن به کوچکترین جزئیات، هیچ کس نباید هیچ نوع کاری را تمرین کند، مگر اینکه از آن بهره ای ببرد. در توبیخ در لذتی که می خواهد مویی از درد باشد عصبانی نشو به این امید که پرورشی نباشد. تا شهوت کور نشوند، بیرون نمی آیند؛ مقصرند که تکالیف خود را رها می کنند و دلها، یعنی زحماتشان را نرم می کنند.',
      'ps':
          'د ناروغ پاملرنه د ناروغ تعقیب لپاره مهمه ده، مګر دا په داسې وخت کې پیښیږي کله چې کار او درد لوړ وي. هیڅوک باید هر ډول کار ترسره نه کړي، تر ټولو کوچنیو توضیحاتو پورې، پرته له دې چې هغه یې ګټه پورته کړي. په هغه خوښۍ کې په ملامت کې مه غوسه کېږه چې د درد ویښتان غواړي په دې هیله چې دا به ونه کرل شي. تر څو چې دوی په شهوت ړانده شوي نه وي، دوی بهر نه راوځي. دوی مجرم دي چې خپل دندې پریږدي او د دوی زړونه نرم کړي، یعنی د دوی هڅې.',
    },
    'uhdpi83c': {
      'en': 'Still need help',
      'fa': 'هنوز به کمک نیاز داری',
      'ps': 'تاسو لاهم مرستې ته اړتیا لرئ',
    },
  },
  // GenralInformation
  {
    'euy69jnr': {
      'en': 'General information',
      'fa': 'اطلاعات کل',
      'ps': 'عمومي معلومات',
    },
    'micu2a4d': {
      'en': 'Name',
      'fa': 'نام',
      'ps': 'نوم',
    },
    '85dkwn36': {
      'en': 'Nargis',
      'fa': 'نرگس',
      'ps': 'نرگس',
    },
    'ihlfgm6l': {
      'en': 'Last name',
      'fa': 'تخلص',
      'ps': 'تخلص',
    },
    'cr8ooc32': {
      'en': 'Ahmadi',
      'fa': 'احمدی',
      'ps': 'احمدی',
    },
    'jnxzr6yt': {
      'en': 'Father name',
      'fa': 'نام پدر ',
      'ps': 'د پلار نوم',
    },
    'bigm6a4p': {
      'en': 'Abdulla',
      'fa': 'عبدالله',
      'ps': 'عبدالله',
    },
    '18z64ysn': {
      'en': 'Tazkra number',
      'fa': 'شماره تذکره',
      'ps': 'د پیژندپاڼې شمیره',
    },
    'sog6dsb2': {
      'en': '1402009034321',
      'fa': '1402009034321',
      'ps': '1402009034321',
    },
    'y2ndh58e': {
      'en': 'Tazkra photo',
      'fa': 'تصویر تذکره',
      'ps': 'د تذکرې عکس',
    },
    'jqqhuz92': {
      'en': 'View',
      'fa': 'مشاهده',
      'ps': 'لید',
    },
    'm2wbara7': {
      'en': 'Personal information',
      'fa': 'اطلاعات شخصی',
      'ps': 'شخصي معلومات',
    },
    '3s3g0qrp': {
      'en': 'Marital status',
      'fa': 'وضعیت تأهل',
      'ps': 'مدني حالت',
    },
    '7qlr2an0': {
      'en': 'Single',
      'fa': 'مجرد',
      'ps': 'واحد',
    },
    'uel7mauz': {
      'en': 'Gender',
      'fa': 'جنسیت',
      'ps': 'جندر',
    },
    'yri4sden': {
      'en': 'Female',
      'fa': 'زن',
      'ps': 'ښځینه',
    },
    'vqhg6wi8': {
      'en': 'Date of birth',
      'fa': 'تاریخ تولد',
      'ps': 'د زیږون نیټه',
    },
    'hd7xbdok': {
      'en': '1374/05/05',
      'fa': '1374/05/05',
      'ps': '1374/05/05',
    },
    'i52gq5m5': {
      'en': 'Phone number',
      'fa': 'شماره تلفن',
      'ps': 'د تلیفون شمیره',
    },
    'ze0lc89b': {
      'en': '0799353567',
      'fa': '0799353567',
      'ps': '0799353567',
    },
    'bv920pyf': {
      'en': 'Address',
      'fa': 'آدرس ',
      'ps': 'پته',
    },
    'm59e0a5t': {
      'en': 'kabul',
      'fa': 'کابل',
      'ps': 'کابل',
    },
    '3v61igid': {
      'en': 'Email',
      'fa': 'آدرس الکترونیک',
      'ps': 'ایمیل',
    },
    '013o681b': {
      'en': 'Nargishmadi@gmail.om',
      'fa': 'Nargishmadi@gmail.om',
      'ps': 'Nargishmadi@gmail.om',
    },
    'zdcmll9z': {
      'en': 'Password',
      'fa': 'کلمه عبور',
      'ps': 'رمز',
    },
    'p8hfwp2b': {
      'en': '*********',
      'fa': '*********',
      'ps': '*********',
    },
  },
  // ResetPassword
  {
    'q9p5z5x1': {
      'en': 'Let\'s get started by filling out the form below.',
      'fa': 'بیایید با پر کردن فرم زیر شروع کنیم.',
      'ps': 'راځئ چې د لاندې فارم په ډکولو سره پیل وکړو.',
    },
    'q54giq0e': {
      'en': 'Old password',
      'fa': 'کلمه عبور قبلی',
      'ps': 'زوړ پټ نوم',
    },
    'xwfnvv4f': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '8bmca0af': {
      'en': 'New password',
      'fa': 'کلمه عبور جدید',
      'ps': 'نوئ پټ نوم',
    },
    'nb1wu0ze': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '6rtvqh4z': {
      'en': 'Confirm  new password',
      'fa': 'رمز عبور جدید را تایید کنید',
      'ps': 'نوی پټنوم تایید کړئ',
    },
    'p6web8o7': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'va437nd4': {
      'en': 'Confirm',
      'fa': 'تایید',
      'ps': 'تایید کړه',
    },
  },
  // EditProfile
  {
    '3wuvhqgo': {
      'en': 'Edit profile details',
      'fa': 'ویرایش جزئیات نمایه',
      'ps': 'د پروفایل توضیحات سم کړئ',
    },
    '9sxiv7v4': {
      'en': 'First name',
      'fa': 'نام',
      'ps': 'لومړی نوم',
    },
    'x82xs6n9': {
      'en': 'Last name',
      'fa': 'تخلص',
      'ps': 'تخلص',
    },
    '2jvnx3o5': {
      'en': 'Male',
      'fa': 'مرد',
      'ps': 'سړی',
    },
    'q3rkxdit': {
      'en': 'Female',
      'fa': 'زن',
      'ps': 'ښځینه',
    },
    'z30hb11m': {
      'en': 'Gender',
      'fa': 'جنسیت',
      'ps': 'جندر',
    },
    'legceoun': {
      'en': 'Search for an item...',
      'fa': 'جستجو برای یک مورد ...',
      'ps': 'د یو شی په لټه کې...',
    },
    'bco3rx00': {
      'en': 'Job',
      'fa': 'وظیفه',
      'ps': 'دنده',
    },
    'mr7l15wl': {
      'en': 'Update',
      'fa': 'به روز رسانی',
      'ps': 'تازه کول',
    },
  },
  // ChildrenClasses
  {
    'df6tefax': {
      'en': 'Computer',
      'fa': 'کمپیوتر',
      'ps': 'کمپیوتر',
    },
    'vwgx5xfa': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسن',
      'ps': 'جکسن',
    },
    'znxi88nw': {
      'en': 'Read Now',
      'fa': 'آلا بخوانید',
      'ps': 'لوستل',
    },
    'aum28kt1': {
      'en': 'AI',
      'fa': 'هوش مصنوعی',
      'ps': 'مصنوعي استخبارات',
    },
    'xpyf3p6k': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسن',
      'ps': 'جکسن',
    },
    't0bkoqab': {
      'en': 'Read Now',
      'fa': 'آلا بخوانید',
      'ps': 'لوستل',
    },
    'j1xyvzl2': {
      'en': 'Dari',
      'fa': 'دری',
      'ps': 'دری',
    },
    'rxvv76m6': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسن',
      'ps': 'جکسن',
    },
    'bevu5pzy': {
      'en': 'Completed',
      'fa': 'تکمیل شد',
      'ps': 'بشپړ شو',
    },
    'llyka9ag': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // ChildrenCourses
  {
    '3e84cqub': {
      'en': 'Computer',
      'fa': 'کمپیوتر ',
      'ps': 'کمپیوتر ',
    },
    'gexdcuk8': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسن',
      'ps': 'جکسن',
    },
    'csvbyiae': {
      'en': 'Read Now',
      'fa': 'آلآ بخوانید',
      'ps': 'اوس ولولئ',
    },
    'r8g302rw': {
      'en': 'AI',
      'fa': 'هوش مصنوعی',
      'ps': 'مصنوعي استخبارات',
    },
    '33e4h8qn': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسن',
      'ps': 'جکسن',
    },
    'w8hsaxue': {
      'en': 'Read Now',
      'fa': 'آلا بخوانید',
      'ps': 'اوس ولولئ',
    },
    '0gbald5n': {
      'en': 'Dari',
      'fa': 'دری',
      'ps': 'دری',
    },
    'b1uc40fm': {
      'en': 'Jackson Hewiit',
      'fa': 'جکسن',
      'ps': 'جکسن',
    },
    'ni3e8v93': {
      'en': 'Completed',
      'fa': 'تکمیل شد',
      'ps': 'بشپړ شوی',
    },
    'xdcb5ca1': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // AssessmentCompleted
  {
    'mxuxah7d': {
      'en': 'Feb 8th',
      'fa': 'فیبروی 8م',
      'ps': 'فیبروی 8م',
    },
    'kr9vr7nm': {
      'en': 'Wednesday',
      'fa': 'چهار شنبه',
      'ps': 'چهارشنبه',
    },
    '8dokrog7': {
      'en': 'Completed',
      'fa': 'تکمیل شد',
      'ps': 'بشپړ شوی',
    },
    'g89sa0lh': {
      'en': 'Marks obtained ',
      'fa': 'علائم به دست آمده',
      'ps': 'ترلاسه شوي نښې',
    },
    'iqismokz': {
      'en': '47',
      'fa': '47',
      'ps': '47',
    },
    'dxh6tvaa': {
      'en': 'Questions',
      'fa': 'پرسش ها',
      'ps': 'پوښتنې',
    },
    '3ezjoy3w': {
      'en': 'What is the value of pi?',
      'fa': 'قیمت Pi چیست',
      'ps': 'د Pi قیمت څومره دی؟',
    },
    '6gvfpjk6': {
      'en': '3.54',
      'fa': '3.54',
      'ps': '3.54',
    },
    'xphaiwqo': {
      'en': '3.14',
      'fa': '3.14',
      'ps': '3.14',
    },
    'auja0abb': {
      'en': '3.11',
      'fa': '3.11',
      'ps': '3.11',
    },
    'lw381b4v': {
      'en': '3.54',
      'fa': '3.54',
      'ps': '3.54',
    },
    'pshes3c6': {
      'en': 'Total internal angles of a triangle is?',
      'fa': 'مجموع زوایای داخلی یک مثلث است؟',
      'ps': 'د مثلث د داخلي زاویو مجموعه څومره ده؟',
    },
    'zqvn4gim': {
      'en': '180',
      'fa': '180',
      'ps': '180',
    },
    '4p99rd1b': {
      'en': '360',
      'fa': '360',
      'ps': '360',
    },
    'enpdwtlj': {
      'en': '180',
      'fa': '180',
      'ps': '180',
    },
    'ihwn03t4': {
      'en': '270',
      'fa': '270',
      'ps': '270',
    },
    'appr7lsn': {
      'en': '90',
      'fa': '90',
      'ps': '90',
    },
    'uowpw55z': {
      'en': 'What is value of Euler number (e) ?',
      'fa': 'ارزش عدد اویلر (e) چیست؟',
      'ps': 'د Euler شمیره (e) څومره ارزښت لري؟',
    },
    'v6rby9q0': {
      'en': '2.71',
      'fa': '2.71',
      'ps': '2.71',
    },
    '480e9yu8': {
      'en': '3.60',
      'fa': '3.60',
      'ps': '3.60',
    },
    'td5094dp': {
      'en': '2.80',
      'fa': '2.80',
      'ps': '2.80',
    },
    'd4un4r7h': {
      'en': '2.71',
      'fa': '2.71',
      'ps': '2.71',
    },
    'm2d5ocp1': {
      'en': 'none',
      'fa': 'هیچکدام',
      'ps': 'هیڅ نه',
    },
    'rhxxv9b7': {
      'en': 'Submit',
      'fa': 'ارسال شده',
      'ps': 'ځړول',
    },
    'll0nz7gn': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Assessments
  {
    'rfnycek9': {
      'en': 'All',
      'fa': 'همه',
      'ps': 'ټول',
    },
    'y9rfja4n': {
      'en': 'Physics',
      'fa': 'فزیک',
      'ps': 'فزیک',
    },
    '9y72bl28': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انگلیسی',
    },
    'xs50lspo': {
      'en': 'Math',
      'fa': 'ریاضی',
      'ps': 'ریاضی',
    },
    '3sl1gsum': {
      'en': 'Geology',
      'fa': 'جیولوژی',
      'ps': 'جیولوژی',
    },
    'c8m5rgjr': {
      'en': 'Dari',
      'fa': 'دری',
      'ps': 'دری',
    },
    'qvle8hls': {
      'en': 'All',
      'fa': 'همه',
      'ps': 'ټول',
    },
    '6m6qadoc': {
      'en': 'Completed',
      'fa': 'تکمیل شده',
      'ps': 'بشپړ شو',
    },
    'w7yhc3kb': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'دلته د دندې توضیحات ایا دا واقعیا اوږد دی او شاید پای ته ورسیږي؟ او دا دوه کرښې ته ځي.',
    },
    '6c1w945r': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'sndxxqzs': {
      'en': '12-02-2024',
      'fa': '12-02-2024',
      'ps': '12-02-2024',
    },
    'xqzrreaj': {
      'en': 'Completed',
      'fa': 'تکمیل شده',
      'ps': 'بشپړ شو',
    },
    'ujskfmei': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'دلته د دندې توضیحات ایا دا واقعیا اوږد دی او شاید پای ته ورسیږي؟ او دا دوه کرښې ته ځي.',
    },
    '8otrpo60': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'lkraifjp': {
      'en': '10-12-2023',
      'fa': '10-12-2023',
      'ps': '10-12-2023',
    },
    'zjcb8wab': {
      'en': 'Expired',
      'fa': 'منقضی شده',
      'ps': 'ختم شوی',
    },
    '3c2gndv4': {
      'en': 'You did not submit your homework for physics subject. ',
      'fa': 'شما تکالیف خود را برای درس فیزیک ارسال نکردید.',
      'ps': 'تاسو خپل کورنی کار د فزیک کورس لپاره ندی سپارلی.',
    },
    'y36jdeqy': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    '77q81c4h': {
      'en': '10-01-2023',
      'fa': '10-01-2023',
      'ps': '10-01-2023',
    },
    'qaxomc84': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // AssessmentSubmitted
  {
    '4urs644d': {
      'en': 'Good job!',
      'fa': 'موفقیت آمیز!',
      'ps': 'ښه کار!',
    },
    'mefw5ci6': {
      'en': 'Your assessment successfully submitted.',
      'fa': 'ارزیابی شما با موفقیت ارسال شد.',
      'ps': 'ستاسو ارزونه په بریالیتوب سره وسپارل شوه.',
    },
    'v6970l34': {
      'en': 'Back to lecture',
      'fa': 'بازگشت به لکچر',
      'ps': 'بیرته لیکچر ته',
    },
    't5unz781': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // TakeAssessment
  {
    '9d3zdv0p': {
      'en': '0:30',
      'fa': '0:30',
      'ps': '0:30',
    },
    'icab7hd3': {
      'en': 'Terminate',
      'fa': 'پایان دادن',
      'ps': 'ختمول',
    },
    'nj31akha': {
      'en': '5%',
      'fa': '5%',
      'ps': '5%',
    },
    'n1t49gsz': {
      'en': 'What is the value of Pi?',
      'fa': 'قیمت PI چند است',
      'ps': 'قیمت PI چند است',
    },
    '7qgu7lhg': {
      'en': '3.141',
      'fa': '3.141',
      'ps': '3.141',
    },
    'znkpwpr1': {
      'en': '3.112',
      'fa': '3.112',
      'ps': '3.112',
    },
    '0qdshup7': {
      'en': '3.543',
      'fa': '3.543',
      'ps': '3.543',
    },
    'qy2m3g18': {
      'en': '3.148',
      'fa': '3.148',
      'ps': '3.148',
    },
    'xtdd3sqw': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Homeworks
  {
    'viv76vs2': {
      'en': 'All',
      'fa': 'همه',
      'ps': 'ټول',
    },
    'gt31tvuq': {
      'en': 'Physics',
      'fa': 'فزیک ',
      'ps': 'فزیک',
    },
    'gzet2hcg': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انگلیسی',
    },
    '954wy9no': {
      'en': 'Math',
      'fa': 'ریاضی',
      'ps': 'ریاضی',
    },
    'tmfamibu': {
      'en': 'Geology',
      'fa': 'جیولوژی',
      'ps': 'جیولوژی',
    },
    'sqhli3pv': {
      'en': 'Dari',
      'fa': 'دری',
      'ps': 'دری',
    },
    'unw3v543': {
      'en': 'All',
      'fa': 'همه',
      'ps': 'ټول',
    },
    '8zqngijl': {
      'en': 'Pending',
      'fa': 'انتظار',
      'ps': 'پاتې',
    },
    'un7nzryl': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'دلته د دندې توضیحات ایا دا واقعیا اوږد دی او شاید پای ته ورسیږي؟ او دا دوه کرښې ته ځي.',
    },
    '4emcense': {
      'en': 'Date: ',
      'fa': 'تاریخ: ',
      'ps': 'نېټه:',
    },
    '6bjtv313': {
      'en': '12-02-2024',
      'fa': '12-02-2024',
      'ps': '12-02-2024',
    },
    '8u0is5st': {
      'en': 'Completed',
      'fa': 'تکمیل شده',
      'ps': 'بشپړ شو',
    },
    'k425nbi1': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'دلته د دندې توضیحات ایا دا واقعیا اوږد دی او شاید پای ته ورسیږي؟ او دا دوه کرښې ته ځي.',
    },
    'rbsk4qfy': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'oudrdwuo': {
      'en': '12-02-2024',
      'fa': '12-02-2024',
      'ps': '12-02-2024',
    },
    'irrdi6y9': {
      'en': 'Pending',
      'fa': 'انتظار',
      'ps': 'پاتې',
    },
    'jhmrw157': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'دلته د دندې توضیحات ایا دا واقعیا اوږد دی او شاید پای ته ورسیږي؟ او دا دوه کرښې ته ځي.',
    },
    'idjqwagi': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'srbi2zpj': {
      'en': '10-12-2023',
      'fa': '10-12-2023',
      'ps': '10-12-2023',
    },
    '7ly8lnrl': {
      'en': 'Expired',
      'fa': 'منقضی شده',
      'ps': 'ختم شوی',
    },
    'xm8kpk60': {
      'en': 'You did not submit your homework for physics subject. ',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'دلته د دندې توضیحات ایا دا واقعیا اوږد دی او شاید پای ته ورسیږي؟ او دا دوه کرښې ته ځي.',
    },
    'b7mdmgvu': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'kwtffs6h': {
      'en': '10-01-2023',
      'fa': '10-01-2023',
      'ps': '10-01-2023',
    },
    'tzed8kwe': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // HomeworkSubmitted
  {
    'feugiltj': {
      'en': 'Good job!',
      'fa': 'موفقیت آمیز!',
      'ps': 'ښه کار!',
    },
    '6lxt4k82': {
      'en': 'Your homework successfully submitted.',
      'fa': 'کارخانگی شما با موفقیت ارسال شد.',
      'ps': 'ستاسو کورنی کار په بریالیتوب سره سپارل شوی.',
    },
    'ckgw76a4': {
      'en': 'Back to lecture',
      'fa': 'بازگشت به لکچر',
      'ps': 'بیرته لیکچر ته',
    },
    'wd6jwa5i': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // HomeworkDetails
  {
    'dootonez': {
      'en': 'Feb 8th',
      'fa': 'فیبروی 8م',
      'ps': 'فیبروی 8م',
    },
    'majvj1nf': {
      'en': 'Wednesday',
      'fa': 'چهارشنیه',
      'ps': 'چهارشنیه',
    },
    'd2n9pb3m': {
      'en': 'Completed',
      'fa': 'تکمیل شده',
      'ps': 'بشپړ شو',
    },
    'rk06dsij': {
      'en': 'Rushd test and exam policy',
      'fa': 'سیاست آزمون و آزمون رشد',
      'ps': 'د ازموینې پالیسي او د ودې ازموینه',
    },
    'd278ssiq': {
      'en':
          'Please solve all the questions by yourself, If system detect any suspicious actions your test will be marked as invalid test.',
      'fa':
          'لطفاً تمام سؤالات را خودتان حل کنید، اگر سیستم هر گونه اقدام مشکوکی را تشخیص دهد، آزمون شما به عنوان آزمون نامعتبر علامت‌گذاری می‌شود.',
      'ps':
          'مهرباني وکړئ ټولې پوښتنې پخپله حل کړئ، که سیسټم کوم شکمن فعالیت ومومي، ستاسو ازموینه به د غلط ازموینې په توګه په نښه شي.',
    },
    '0zv1rvbd': {
      'en': 'Questions',
      'fa': 'پرسشها',
      'ps': 'پوښتنې',
    },
    'yvsj38th': {
      'en': 'Please find the area of a circle?',
      'fa': 'لطفا مساحت دایره را پیدا کنید؟',
      'ps': 'مهرباني وکړئ د حلقې ساحه ومومئ؟',
    },
    '87vimubu': {
      'en': 'Please use a know farmula to find circle area.',
      'fa': 'لطفاً از یک farmula know برای پیدا کردن ناحیه دایره استفاده کنید.',
      'ps':
          'مهرباني وکړئ د یوې دایرې ساحې موندلو لپاره یو پیژندل شوی فارمول وکاروئ.',
    },
    '660qcbce': {
      'en': '8 marks',
      'fa': '8 نمره',
      'ps': '۸ نمرې',
    },
    '15md4gjb': {
      'en': 'Answer',
      'fa': 'پاسخ',
      'ps': 'ځواب',
    },
    'j675xa9g': {
      'en': 'Please define rectangle?',
      'fa': 'لطفا مستطیل را تعریف کنید؟',
      'ps': 'مهرباني وکړئ مستطیل تعریف کړئ؟',
    },
    '6l66cc11': {
      'en': 'Please use a know farmula to find circle area.',
      'fa': 'لطفاً از یک farmula know برای پیدا کردن ناحیه دایره استفاده کنید.',
      'ps':
          'مهرباني وکړئ د یوې دایرې ساحې موندلو لپاره یو پیژندل شوی فارمول وکاروئ.',
    },
    'kc6au46s': {
      'en': '2 marks',
      'fa': '2  نمره',
      'ps': '2 نمرې',
    },
    'qjphd0a1': {
      'en': 'Answer',
      'fa': 'پاسخ',
      'ps': 'ځواب',
    },
    'qxfaqw4z': {
      'en': 'Please define rectangle?',
      'fa': 'لطفا مستطیل را تعریف کنید؟',
      'ps': 'مهرباني وکړئ مستطیل تعریف کړئ؟',
    },
    'xo89dsfx': {
      'en': 'A short history into what UX design is and the history of it.',
      'fa': 'تاریخچه کوتاهی در مورد طراحی UX و تاریخچه آن.',
      'ps': 'د UX ډیزاین او د هغې تاریخ لنډ تاریخ.',
    },
    'pster29w': {
      'en': '8 marks',
      'fa': '8 نمره',
      'ps': '۸ نمرې',
    },
    'e5f3tv90': {
      'en': 'Your answer here',
      'fa': 'پاسخ شما اینجاست',
      'ps': 'دلته ستاسو ځواب دی',
    },
    'cpr99ufh': {
      'en': 'Intro to UX Design',
      'fa': 'مقدمه ای بر طراحی UX',
      'ps': 'د ډیزاین پیژندنه',
    },
    '6bk6ym8l': {
      'en': 'A short history into what UX design is and the history of it.',
      'fa': 'تاریخچه کوتاهی در مورد طراحی UX و تاریخچه آن.',
      'ps': 'د UX ډیزاین او د هغې تاریخ لنډ تاریخ.',
    },
    'pblf3a08': {
      'en': '3.14',
      'fa': '3.14',
      'ps': '3.14',
    },
    '9uwqjrfb': {
      'en': '3.11',
      'fa': '3.11',
      'ps': '3.11',
    },
    'ktojgak3': {
      'en': '3.54',
      'fa': '3.54',
      'ps': '3.54',
    },
    '42urf8fi': {
      'en': '1 mark',
      'fa': '11 نمره',
      'ps': '11 نمرې',
    },
    'v7gtzqnq': {
      'en': 'Submit your answers',
      'fa': 'پاسخ های خود را ارسال کنید',
      'ps': 'خپل ځوابونه وسپارئ',
    },
    '77w1q063': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // Myactivities
  {
    'fzsfqli3': {
      'en': 'Last 30 Days',
      'fa': '30 روز گذشته',
      'ps': 'وروستۍ 30 ورځې',
    },
    'b7j7j6xg': {
      'en': 'Avg. Grade',
      'fa': 'اوسط نمرات',
      'ps': 'اوسط نمرې',
    },
    'fx2brqsf': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // ReviewHomework
  {
    'q5bxkwqz': {
      'en': 'Last 30 Days',
      'fa': '30 روز گذشته',
      'ps': 'وروستۍ 30 ورځې',
    },
    '3e35rfjz': {
      'en': 'Avg. Grade',
      'fa': 'اوسط نمرات',
      'ps': 'اوسط نمرې',
    },
    'h7g98cju': {
      'en': 'All',
      'fa': 'همه ',
      'ps': 'ټول',
    },
    'xaem4l8v': {
      'en': 'Physics',
      'fa': 'فزیک',
      'ps': 'فزیک',
    },
    'cagdjmec': {
      'en': 'English',
      'fa': 'انگلیسی',
      'ps': 'انگلیسی',
    },
    'wvlzrfne': {
      'en': 'Math',
      'fa': 'ریاضی',
      'ps': 'ریاضی',
    },
    'kzph20dr': {
      'en': 'Geology',
      'fa': 'جیولوژی',
      'ps': 'جیولوژی',
    },
    '9er2w2cy': {
      'en': 'Dari',
      'fa': 'دری',
      'ps': 'دری',
    },
    'nvwx154f': {
      'en': 'All',
      'fa': 'همه',
      'ps': 'ټول',
    },
    '6jbn9gfn': {
      'en': 'Homeworks',
      'fa': 'کارخانگی',
      'ps': 'کورنی دنده',
    },
    '8znf7p8h': {
      'en': 'A summary of homeworks and assessments',
      'fa': 'خلاصه ای از تکالیف و ارزیابی ها',
      'ps': 'د کور کارونو او ارزونو لنډیز',
    },
    '7c59r231': {
      'en': 'Homework completed',
      'fa': 'کارخانگی تکمیل شد',
      'ps': 'د کور کار بشپړ شو',
    },
    'k54crz0w': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    'uic6o79x': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'z5b2is48': {
      'en': '12-02-2024',
      'fa': '12-02-2024',
      'ps': '12-02-2024',
    },
    '55o967yk': {
      'en': 'Assessment passed',
      'fa': 'ارزیابی به تصویب رسید',
      'ps': 'ارزونه تیره شوه',
    },
    'ogh2y8ob': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'fa':
          'شرح وظیفه در اینجا این یکی واقعا طولانی است و شاید تمام شود؟ و به دو خط می رود.',
      'ps':
          'د دندې توضیحات دلته دا واقعیا اوږد دی او شاید تیریږي؟ او دوه کرښې ته ځي.',
    },
    'vjcd21v9': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    '799b9gnm': {
      'en': '10-12-2023',
      'fa': '10-12-2023',
      'ps': '10-12-2023',
    },
    'fil7lwbu': {
      'en': 'Homework not submitted',
      'fa': 'کارخانگی ارسال نشد',
      'ps': 'کورنی کار ندی سپارل شوی',
    },
    'hcu36wl8': {
      'en': 'You did not submit your homework for physics subject. ',
      'fa': 'شما تکالیف خود را برای درس فیزیک ارسال نکردید.',
      'ps': 'تاسو خپل کورنی کار د فزیک مضمون لپاره ندی سپارلی.',
    },
    'phm72y5k': {
      'en': 'Date: ',
      'fa': 'تاریخ:',
      'ps': 'نېټه:',
    },
    'wn5922if': {
      'en': '10-01-2023',
      'fa': '10-01-2023',
      'ps': '10-01-2023',
    },
    'wthq9lv7': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // EditContact
  {
    'y38m39co': {
      'en': 'Edit contact details',
      'fa': 'ویرایش جزئیات نمایه',
      'ps': 'د پروفایل توضیحات سم کړئ',
    },
    'xr6mym90': {
      'en': 'Single',
      'fa': 'مجرد',
      'ps': 'یوازې',
    },
    'u1aowrq3': {
      'en': 'Married',
      'fa': 'متاهل',
      'ps': 'واده',
    },
    's60tpbjo': {
      'en': 'Widow',
      'fa': 'بیوه',
      'ps': 'کونډه',
    },
    '31274o2h': {
      'en': 'Divorced',
      'fa': 'جدا شده',
      'ps': 'طلاق شوی',
    },
    'p6eb9cx9': {
      'en': 'Marital status',
      'fa': 'حالت مدنی',
      'ps': 'مدني حالت',
    },
    'klbm6yus': {
      'en': 'Search for an item...',
      'fa': 'جستجو برای یک مورد ...',
      'ps': 'د یو توکي لټون...',
    },
    'xnzmfc9j': {
      'en': 'Phone number',
      'fa': 'شماره تلفن',
      'ps': 'د تلیفون شمیره',
    },
    'f27d22qv': {
      'en': 'Address',
      'fa': 'آدرس',
      'ps': 'پته',
    },
    'djt2jl3t': {
      'en': 'Email',
      'fa': 'آدرس الکترونیکی',
      'ps': 'ایمیل',
    },
    'rpdzplwt': {
      'en': 'Update',
      'fa': 'به روز رسانی',
      'ps': 'تازه کول',
    },
  },
  // Settings
  {
    'gm5bm853': {
      'en': 'Change language',
      'fa': 'انتخاب زبان',
      'ps': 'د ژبې انتخاب',
    },
    'ccotc8cb': {
      'en': 'English',
      'fa': 'English',
      'ps': 'English',
    },
    '7afp613g': {
      'en': 'فارسی',
      'fa': 'فارسی',
      'ps': 'فارسی',
    },
    'r5atyro2': {
      'en': 'پښتو',
      'fa': 'پښتو',
      'ps': 'پښتو',
    },
  },
  // Notifications
  {
    'lts730do': {
      'en': 'Final exam schedualed',
      'fa': '',
      'ps': '',
    },
    'lzpmjsxc': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fa':
          'مراقبت از بیمار مهم است که بیمار دنبالش باشد، اما این اتفاق در زمانی می افتد که کار و درد زیاد است. برای رسیدن به کوچکترین جزئیات، هیچ کس نباید هیچ نوع کاری را تمرین کند، مگر اینکه از آن بهره ای ببرد. در توبیخ در لذتی که می خواهد مویی از درد باشد عصبانی نشو به این امید که پرورشی نباشد. تا شهوت کور نشوند، بیرون نمی آیند؛ مقصرند که تکالیف خود را رها می کنند و دلها، یعنی زحماتشان را نرم می کنند.',
      'ps':
          'د ناروغ پاملرنه د ناروغ تعقیب لپاره مهمه ده، مګر دا په داسې وخت کې پیښیږي کله چې کار او درد لوړ وي. هیڅوک باید هر ډول کار ترسره نه کړي، تر ټولو کوچنیو توضیحاتو پورې، پرته له دې چې هغه یې ګټه پورته کړي. په هغه خوښۍ کې په ملامت کې مه غوسه کېږه چې د درد ویښتان غواړي په دې هیله چې دا به ونه کرل شي. تر څو چې دوی په شهوت ړانده شوي نه وي، دوی بهر نه راوځي. دوی مجرم دي چې خپل دندې پریږدي او د دوی زړونه نرم کړي، یعنی د دوی هڅې.',
    },
    '8e7hpb3p': {
      'en': 'Holyday announcement',
      'fa': '',
      'ps': '',
    },
    'hli9rdsk': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fa':
          'مراقبت از بیمار مهم است که بیمار دنبالش باشد، اما این اتفاق در زمانی می افتد که کار و درد زیاد است. برای رسیدن به کوچکترین جزئیات، هیچ کس نباید هیچ نوع کاری را تمرین کند، مگر اینکه از آن بهره ای ببرد. در توبیخ در لذتی که می خواهد مویی از درد باشد عصبانی نشو به این امید که پرورشی نباشد. تا شهوت کور نشوند، بیرون نمی آیند؛ مقصرند که تکالیف خود را رها می کنند و دلها، یعنی زحماتشان را نرم می کنند.',
      'ps':
          'د ناروغ پاملرنه د ناروغ تعقیب لپاره مهمه ده، مګر دا په داسې وخت کې پیښیږي کله چې کار او درد لوړ وي. هیڅوک باید هر ډول کار ترسره نه کړي، تر ټولو کوچنیو توضیحاتو پورې، پرته له دې چې هغه یې ګټه پورته کړي. په هغه خوښۍ کې په ملامت کې مه غوسه کېږه چې د درد ویښتان غواړي په دې هیله چې دا به ونه کرل شي. تر څو چې دوی په شهوت ړانده شوي نه وي، دوی بهر نه راوځي. دوی مجرم دي چې خپل دندې پریږدي او د دوی زړونه نرم کړي، یعنی د دوی هڅې.',
    },
    '0jkmq6wb': {
      'en': 'Home',
      'fa': '',
      'ps': '',
    },
  },
  // OpenBook
  {
    'bahg7qzr': {
      'en': 'Home',
      'fa': 'صفحه اصلی',
      'ps': 'اصلي پاڼه',
    },
  },
  // SearchStudentBottomSheet
  {
    'v8q8wuys': {
      'en': 'Search student...',
      'fa': 'جستجوی دانش آموز ...',
      'ps': 'د زده کونکي لټون...',
    },
  },
  // StudentList
  {
    'j1a5vngw': {
      'en': 'Randy Peterson',
      'fa': 'رندی پترسون',
      'ps': 'رندی پترسون',
    },
    '8ib4psak': {
      'en': 'Class: 12',
      'fa': 'صنف:12',
      'ps': 'ټولګی: 12',
    },
    'qpgnyqfb': {
      'en': 'Randy Peterson',
      'fa': 'رندی پترسون',
      'ps': 'رندی پترسون',
    },
    'vlbsbh7f': {
      'en': 'Class: 4',
      'fa': 'صنف:4',
      'ps': 'ټولګی: 4',
    },
    't4pli437': {
      'en': 'Randy Peterson',
      'fa': 'رندی پترسون',
      'ps': 'رندی پترسون',
    },
    '3b58norr': {
      'en': 'Class: 5',
      'fa': 'صنف:5',
      'ps': 'ټولګی: 5',
    },
    'vsh525fg': {
      'en': 'Randy Peterson',
      'fa': 'رندی پترسون',
      'ps': 'رندی پترسون',
    },
    'e6evr1aj': {
      'en': 'Class: 7',
      'fa': 'صنف:7',
      'ps': 'ټولګی: ۷',
    },
  },
  // ActivityComponent
  {
    'oio5tb7t': {
      'en': 'Activities',
      'fa': 'فعالیت ها',
      'ps': 'فعالیتونه',
    },
    'm5scs2ec': {
      'en': 'Recent activities by Hekmatullah',
      'fa': 'آخرین فعالیت',
      'ps': 'وروستی فعالیت',
    },
    'w3cxt43s': {
      'en': 'Hekmatullah',
      'fa': 'حکمت الله',
      'ps': 'حکمت الله',
    },
    'jdopilbg': {
      'en': '4 months ago',
      'fa': '4 ماه گذشته',
      'ps': 'وروستي 4 میاشتې',
    },
    'siq0u532': {
      'en': 'Completed ',
      'fa': 'تکمیل شده',
      'ps': 'بشپړ شو',
    },
    'kowjnxfs': {
      'en': 'Arabic course',
      'fa': 'کورس زبان عربی',
      'ps': 'د عربي ژبې کورس',
    },
    '7qiezkdr': {
      'en': 'Hekmatullah',
      'fa': 'حکمت الله',
      'ps': 'حکمت الله',
    },
    'qwk9mx9q': {
      'en': '4 days ago',
      'fa': '4 روز گذشه',
      'ps': '۴ ورځې تېرې شوې',
    },
    'mp874x28': {
      'en': 'Started ',
      'fa': 'آغاز',
      'ps': 'پیل',
    },
    'kjywe2x3': {
      'en': 'Computer course',
      'fa': 'کورس کمپیوتر',
      'ps': 'د کمپیوټر کورس',
    },
    'z4ybjtz9': {
      'en': 'Hekmatullah',
      'fa': 'حکمت الله',
      'ps': 'حکمت الله',
    },
    'iq0ptgef': {
      'en': '1 month ago',
      'fa': '1 ماه گذشته',
      'ps': '1 میاشت دمخه',
    },
    'xq1eje8l': {
      'en': 'Started ',
      'fa': 'آغاز شده',
      'ps': 'پیل شو',
    },
    '51rogtvi': {
      'en': 'English course',
      'fa': 'کورس زبان  انگلیسی',
      'ps': 'د انګلیسي ژبې کورس',
    },
    'cc51xele': {
      'en': 'Hekmatullah',
      'fa': 'حکمت الله',
      'ps': 'حکمت الله',
    },
    'l9jafd5q': {
      'en': '9 months ago',
      'fa': '9 ماه گذشته',
      'ps': 'وروستۍ 9 میاشتې',
    },
    'qrnexedh': {
      'en': 'Completed ',
      'fa': 'تکیمیل شده',
      'ps': 'بشپړ شوی',
    },
    'sch7tt3a': {
      'en': 'English assessment',
      'fa': 'ارزیابی زبان انگلیسی',
      'ps': 'د انګلیسي ارزونه',
    },
  },
  // UserChatList
  {
    'rpq4kogp': {
      'en': 'Rushd support',
      'fa': 'پشتیبانی',
      'ps': 'ملاتړ',
    },
    's6c4jmqm': {
      'en': 'Bye for now...',
      'fa': 'فعلا خدا حافظ',
      'ps': 'د اوس لپاره د خدای په امان...',
    },
  },
  // NotificationBell
  {
    'y741u8l3': {
      'en': '1',
      'fa': '1',
      'ps': '1',
    },
  },
  // BookAuthor
  {
    'dms0bmbb': {
      'en': 'John Thoh',
      'fa': 'جان',
      'ps': 'جان',
    },
    '3b3oge08': {
      'en': 'Secondary text',
      'fa': 'متن دومی',
      'ps': 'دوهم متن',
    },
  },
  // DesktopSidebar
  {
    'wgeuqa5e': {
      'en': 'Zia Akbari',
      'fa': 'ضیا اکبری',
      'ps': 'ضیا اکبری',
    },
    '79qr8s12': {
      'en': 'Dashboard',
      'fa': '',
      'ps': '',
    },
    'vmke4bow': {
      'en': 'Profile',
      'fa': '',
      'ps': '',
    },
    '71tx5w4i': {
      'en': 'Children',
      'fa': '',
      'ps': '',
    },
    'jzndnc0i': {
      'en': 'Notice board',
      'fa': '',
      'ps': '',
    },
    'cnzksl24': {
      'en': 'Courses',
      'fa': '',
      'ps': '',
    },
    'yn7ah933': {
      'en': 'Messaging',
      'fa': '',
      'ps': '',
    },
    'qmh1k0id': {
      'en': 'Logout',
      'fa': '',
      'ps': '',
    },
  },
  // MobileAppbarWithDrawer
  {
    'g3wggbkw': {
      'en': 'Page title',
      'fa': '',
      'ps': '',
    },
  },
  // MobileDrawer
  {
    'e5tottr9': {
      'en': 'Zia Akbari',
      'fa': 'ضیا اکبری',
      'ps': 'ضیا اکبری',
    },
    'pi16s1s7': {
      'en': 'Profile',
      'fa': '',
      'ps': '',
    },
    'p5q7n1zw': {
      'en': 'Notice board',
      'fa': '',
      'ps': '',
    },
    '5fhuza2r': {
      'en': 'Help center',
      'fa': '',
      'ps': '',
    },
    'np9lnvlr': {
      'en': 'Logout',
      'fa': '',
      'ps': '',
    },
  },
  // MobileAppbar
  {
    'amnwllbl': {
      'en': 'Page title',
      'fa': 'سلام دنیا',
      'ps': 'سلام نړی',
    },
  },
  // DesktopAppbar
  {
    'vc2l4veh': {
      'en': 'Page title',
      'fa': '',
      'ps': '',
    },
  },
  // Miscellaneous
  {
    'hhmmna5i': {
      'en': 'Label here...',
      'fa': '',
      'ps': '',
    },
    'yf82sdrh': {
      'en': 'Option 1',
      'fa': '',
      'ps': '',
    },
    'ivrmvio1': {
      'en': 'Please select...',
      'fa': '',
      'ps': '',
    },
    '8j6hrjif': {
      'en': 'Search for an item...',
      'fa': '',
      'ps': '',
    },
    'm6fn7u1i': {
      'en': 'Button',
      'fa': '',
      'ps': '',
    },
    'p31wnzaf': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'wek09zn0': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'w7l9kut9': {
      'en': '',
      'fa': 'خطا',
      'ps': 'خطا',
    },
    'f5yqnciu': {
      'en': '',
      'fa': 'ایمیل بازنشانی رمز عبور ارسال شد!',
      'ps': 'د پټنوم بیا تنظیم بریښنالیک لیږل شوی!',
    },
    'suuru0lr': {
      'en': '',
      'fa': 'ایمیل مورد نیاز است',
      'ps': 'بریښنالیک اړین دی',
    },
    '7lk1i368': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'h504lyu0': {
      'en': '',
      'fa': 'رمز عبور مطابقت ندارد',
      'ps': 'پاسورډ سره سمون نه خوري',
    },
    '86ko4waa': {
      'en': '',
      'fa': 'کد تایید پیامکی را وارد کنید',
      'ps': 'د SMS تایید کوډ دننه کړئ',
    },
    '0e3h54m9': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'pfrbtnv9': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'gyl12hqo': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'oiejdzhe': {
      'en': '',
      'fa': 'حساب کاربری در جریان استفاده توسط شخص دیگری است',
      'ps': '',
    },
    'kidkcg81': {
      'en': '',
      'fa': 'فرمت فایل نامعتبر',
      'ps': 'د ناسم فایل بڼه',
    },
    '61a43pgr': {
      'en': '',
      'fa': 'در حال بارگیری...',
      'ps': '',
    },
    'ccxjmzmh': {
      'en': '',
      'fa': 'موفق!',
      'ps': '',
    },
    'ztxgk2tz': {
      'en': '',
      'fa': 'داده ها بارگذاری نشد',
      'ps': 'د معلوماتو په پورته کولو کې پاتې راغلی',
    },
    '2j07nxmh': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'r1hn62l4': {
      'en': '',
      'fa': 'انتخاب منبع',
      'ps': '',
    },
    '3r1jiqib': {
      'en': '',
      'fa': 'گالری',
      'ps': '',
    },
    '4hn8xlse': {
      'en': '',
      'fa': 'گالری',
      'ps': '',
    },
    'u70ufxqd': {
      'en': '',
      'fa': 'گالری (ویدیو)',
      'ps': '',
    },
    '4dox00cw': {
      'en': '',
      'fa': 'دوربین',
      'ps': '',
    },
    'tmomys54': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'xcqdo4qb': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    '5fcoirxf': {
      'en': '',
      'fa': '',
      'ps': '',
    },
    'lg199ha0': {
      'en': '',
      'fa': '',
      'ps': '',
    },
  },
].reduce((a, b) => a..addAll(b));
