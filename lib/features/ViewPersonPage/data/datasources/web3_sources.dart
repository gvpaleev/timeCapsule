import 'package:TimeCapsule/features/ViewPersonPage/data/models/person_model.dart';
import 'package:web3dart/web3dart.dart';

abstract class Web3DataSource {
  final EthPrivateKey credentials;

  final DeployedContract usdtContract;
  final DeployedContract capsuleContract;

  Web3DataSource({
    required this.credentials,
    required this.usdtContract,
    required this.capsuleContract,
  });

  Future<String> getAddresOwner();
  Future<String> getBalanceBnb();
  Future<String> getBalanceUsdt();
  Future<Iterable<PersonModel>> getPersons();
}

class Web3DataSourceImpl extends Web3DataSource {
  Web3DataSourceImpl({
    required String privateKeyString,
    required String usdtContractAddressString,
    required String abiUsdtContractString,
    required String bnbContractAddressString,
    required String abiBnbContractString,
  }) : super(
            credentials: EthPrivateKey.fromHex(privateKeyString),
            usdtContract: DeployedContract(
                ContractAbi.fromJson(abiUsdtContractString, 'usdt'),
                EthereumAddress.fromHex(usdtContractAddressString)),
            capsuleContract: DeployedContract(
                ContractAbi.fromJson(abiBnbContractString, 'capsule'),
                EthereumAddress.fromHex(bnbContractAddressString)));

  @override
  Future<String> getBalanceBnb() async {
    return '0.0';
  }

  @override
  Future<String> getBalanceUsdt() async {
    return '0.0';
  }

  @override
  Future<String> getAddresOwner() async {
    return 'addres';
  }

  @override
  Future<Iterable<PersonModel>> getPersons() async {
    return [
      [
        'Joe Biden',
        '20/11/1942',
        'Joseph Robinette Biden Jr. is an American politician who is the 46th and current president of the United States. A member of the Democratic Party, he previously served as the 47th vice president from 2009 to 2017 under President Barack Obama and represented Delaware in the United States Senate from 1973 to 2009',
        'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg'
      ],
      [
        'Xi Jinping',
        '15 June 1953 ',
        'Xi Jinping is a Chinese politician who has been the general secretary of the Chinese Communist Party and chairman of the Central Military Commission, and thus the paramount leader of China, since 2012. Xi has also been the president of the People\'s Republic of China since 2013.',
        'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
        ['Comment 1', 'comment 2', 'comment 3', 'comment 4'],
      ],
      [
        'Fumio Kishida',
        '	29 July 1957',
        'Fumio Kishida is a Japanese politician who has served as Prime Minister of Japan and President of the Liberal Democratic Party (LDP) since 2021. A member of the House of Representatives, he previously served as Minister for Foreign Affairs from 2012 to 2017 and as acting Minister of Defense in 2017. From 2017 to 2020, he also chaired the LDP Policy Research Council.',
        'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
        ['Comment 1', 'comment 2', 'comment 3', 'comment 4'],
      ],
      [
        'Olaf Scholz',
        '14 June 1958',
        'Olaf Scholz is a German politician who has been serving as the chancellor of Germany since 8 December 2021. A member of the Social Democratic Party, he previously served as Vice Chancellor in the fourth Merkel cabinet and as Federal Minister of Finance from 2018 to 2021.',
        'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
        ['Comment 1', 'comment 2', 'comment 3', 'comment 4'],
      ],
      [
        'Droupadi Murmu',
        '25 July 2022',
        'Droupadi Murmu is an Indian politician and former teacher who is serving as the 15th and current President of India since 2022. She won the 2022 presidential election as a candidate of the Bharatiya Janata Party.',
        'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
        ['Comment 1', 'comment 2', 'comment 3', 'comment 4'],
      ],
      [
        'Charles III',
        '14 November 1948 ',
        'Charles III is King of the United Kingdom and the 14 other Commonwealth realms. Charles was born in Buckingham Palace during the reign of his maternal grandfather, King George VI, and became heir apparent when his mother, Queen Elizabeth II, acceded to the throne in 1952.',
        'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
        ['Comment 1', 'comment 2', 'comment 3', 'comment 4'],
      ],
      [
        'Emmanuel Macron',
        '21 December 1977',
        'Emmanuel Jean-Michel Frédéric Macron is a French politician who has been President of France since 2017. Macron is ex officio one of the two Co-Princes of Andorra.',
        'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
        ['Comment 1', 'comment 2', 'comment 3', 'comment 4'],
      ],
      [
        'Sergio Mattarella',
        '23 July 1941',
        'Sergio Mattarella OMRI OMCA is an Italian politician, jurist, academic, and lawyer who has been President of Italy since 2015. He is the longest-serving president in the history of the Italian Republic. Since Giorgio Napolitano\'s death in 2023, Mattarella has been the only living Italian president.',
        'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
        ['Comment 1', 'comment 2', 'comment 3', 'comment 4'],
      ],
      [
        'Luiz Inácio Lula da Silva',
        '27 October 1945',
        'Luiz Inácio Lula da Silva, also known as Lula da Silva or simply Lula, is a Brazilian politician who is the 39th and incumbent President of Brazil since 2023. A member of the Workers\' Party, Lula was also the 35th president from 2003 to 2010. He also holds the presidency of the G20 since 2023. ',
        'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
        ['Comment 1', 'comment 2', 'comment 3', 'comment 4'],
      ],
      [
        'Justin Trudeau',
        '25 December 1971',
        'Trudeau was born in Ottawa and attended Collège Jean-de-Brébeuf. He graduated from McGill University in 1994 with a Bachelor of Arts degree in literature, then in 1998 acquired a Bachelor of Education degree from the University of British Columbia. After graduating he taught at the secondary school level in Vancouver, before relocating back to Montreal in 2002 to further his studies. He was chair for the youth charity Katimavik and director of the not-for-profit Canadian Avalanche Association. In 2006, he was appointed as chair of the Liberal Party\'s Task Force on Youth Renewal.',
        'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
        ['Comment 1', 'comment 2', 'comment 3', 'comment 4'],
      ],
      [
        'Yoon Suk Yeol',
        '18 December 1960',
        'Yoon Suk Yeol is a South Korean politician who is the 13th and current president of South Korea since 2022. Prior to his presidency, he served as the prosecutor general of South Korea between 2019 and 2021. Born in Seoul, Yoon attended Seoul National University.',
        'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
        ['Comment 1', 'comment 2', 'comment 3', 'comment 4'],
      ],
      [
        'Pedro Sánchez',
        '29 February 1972 ',
        'Pedro Sánchez Pérez-Castejón is a Spanish politician who has been Prime Minister of Spain since June 2018.',
        'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
        ['Comment 1', 'comment 2', 'comment 3', 'comment 4'],
      ],
    ].map<PersonModel>((element) {
      var [name, dataOfbirth, description, imgUrl, comment] = element;
      return PersonModel(
          name: name as String,
          description: description as String,
          imgUrl: imgUrl as String,
          comments: (comment as Iterable)
              .map<CommentModel>((e) => CommentModel(comment: e as String)));
    });
  }
}
