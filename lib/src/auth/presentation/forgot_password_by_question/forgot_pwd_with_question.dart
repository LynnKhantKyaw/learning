import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/auth/presentation/common/pwd_change_email_reusable_scaffold.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:learning/src/auth/presentation/password_change.dart';

List<String> _dateList = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31'
];
List<String> _monthList = [
  //in short terms
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];
List<String> _yearList = [
  //from 1900 to 2022 in one suggestion
  '1900',
  '1901',
  '1902',
  '1903',
  '1904',
  '1905',
  '1906',
  '1907',
  '1908',
  '1909',
  '1910',
  '1911',
  '1912',
  '1913',
  '1914',
  '1915',
  '1916',
  '1917',
  '1918',
  '1919',
  '1920',
  '1921',
  '1922',
  '1923',
  '1924',
  '1925',
  '1926',
  '1927',
  '1928',
  '1929',
  '1930',
  '1931',
  '1932',
  '1933',
  '1934',
  '1935',
  '1936',
  '1937',
  '1938',
  '1939',
  '1940',
  '1941',
  '1942',
  '1943',
  '1944',
  '1945',
  '1946',
  '1947',
  '1948',
  '1949',
  '1950',
  '1951',
  '1952',
  '1953',
  '1954',
  '1955',
  '1956',
  '1957',
  '1958',
  '1959',
  '1960',
  '1961',
  '1962',
  '1963',
  '1964',
  '1965',
  '1966',
  '1967',
  '1968',
  '1969',
  '1970',
  '1971',
  '1972',
  '1973',
  '1974',
  '1975',
  '1976',
  '1977',
  '1978',
  '1979',
  '1980',
  '1981',
  '1982',
  '1983',
  '1984',
  '1985',
  '1986',
  '1987',
  '1988',
  '1989',
  '1990',
  '1991',
  '1992',
  '1993',
  '1994',
  '1995',
  '1996',
  '1997',
  '1998',
  '1999',
  '2000',
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2006',
  '2007',
  '2008',
  '2009',
  '2010',
  '2011',
  '2012',
  '2013',
  '2014',
  '2015',
  '2016',
  '2017',
  '2018',
  '2019',
  '2020',
  '2021',
  '2022',
];

class ForgotPwdWithQuestion extends StatefulWidget {
  const ForgotPwdWithQuestion({super.key});

  @override
  State<ForgotPwdWithQuestion> createState() => _ForgotPwdWithQuestionState();
}

class _ForgotPwdWithQuestionState extends State<ForgotPwdWithQuestion> {
  @override
  Widget build(BuildContext context) {
    return PwdChangeEmailScaffold(
      isQuestion: true,
      topPadding: 40,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password ပြောင်းမည့် Name ကိုထည့်သွင်းပေးပါ',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Material(
                  elevation: 2,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      isDense: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Date of Birth / မွေးသက္ကရာဇ်',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomDropdownButton2(
                  dropdownDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: Colors.white,
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
                  buttonDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: Colors.white,
                  ),
                  hint: '1',
                  dropdownItems: _dateList,
                  onChanged: (String? value) {},
                  value: null,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: CustomDropdownButton2(
                  dropdownDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: Colors.white,
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
                  buttonDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: Colors.white,
                  ),
                  hint: 'January',
                  dropdownItems: _monthList,
                  onChanged: (String? value) {},
                  value: null,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: CustomDropdownButton2(
                  dropdownDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: Colors.white,
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
                  buttonDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: Colors.white,
                  ),
                  hint: '1999',
                  dropdownItems: _yearList,
                  onChanged: (String? value) {},
                  value: null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          BouncingWidget(
            duration: const Duration(milliseconds: 400),
            scaleFactor: 1.5,
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PasswordChange(),
                ),
              );
            },
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/button_green_round.png",
                  width: MediaQuery.of(context).size.width * 0.13,
                  height: 50,
                  fit: BoxFit.fill,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 35,
                  ),
                  child: Text(
                    "Next",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
