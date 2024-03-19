import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

installContractTimeContract() async {
  print('Start scrypt InstallContractTimeContract');
  await dotenv.load();

  late EthPrivateKey credentials = EthPrivateKey.fromHex(
      '34654e917a958da2cd01c3ee56397d2391ffdf0258b7c7fbdea6fbb955875a7c');
  final address = credentials.address;
  final Web3Client web3Client =
      Web3Client(dotenv.get('RPC_URL_NODE'), Client());
  EthereumAddress usdtContractAddress =
      EthereumAddress.fromHex(dotenv.get('USDT_CONTRACT_ADDRESS'));
  DeployedContract usdtContract = DeployedContract(
      ContractAbi.fromJson(dotenv.get('USDT_CONTRACT_ABI'), 'usdt'),
      usdtContractAddress);

  EthereumAddress capsuleContractAddress =
      EthereumAddress.fromHex(dotenv.get('CAPSULE_TIME_CONTRACT_ADDRESS'));
  DeployedContract capsuleContract = DeployedContract(
      ContractAbi.fromJson(dotenv.get('CAPSULE_TIME_CONTRACT_ABI'), 'capsule'),
      capsuleContractAddress);
  // top 13 https://ru.wikipedia.org/wiki/%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA_%D1%81%D1%82%D1%80%D0%B0%D0%BD_%D0%BF%D0%BE_%D0%92%D0%92%D0%9F_(%D0%BD%D0%BE%D0%BC%D0%B8%D0%BD%D0%B0%D0%BB)
  List<List<String>> humansCapsule = [
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
    ],
    [
      'Fumio Kishida',
      '	29 July 1957',
      'Fumio Kishida is a Japanese politician who has served as Prime Minister of Japan and President of the Liberal Democratic Party (LDP) since 2021. A member of the House of Representatives, he previously served as Minister for Foreign Affairs from 2012 to 2017 and as acting Minister of Defense in 2017. From 2017 to 2020, he also chaired the LDP Policy Research Council.',
      'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
    ],
    [
      'Olaf Scholz',
      '14 June 1958',
      'Olaf Scholz is a German politician who has been serving as the chancellor of Germany since 8 December 2021. A member of the Social Democratic Party, he previously served as Vice Chancellor in the fourth Merkel cabinet and as Federal Minister of Finance from 2018 to 2021.',
      'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
    ],
    [
      'Droupadi Murmu',
      '25 July 2022',
      'Droupadi Murmu is an Indian politician and former teacher who is serving as the 15th and current President of India since 2022. She won the 2022 presidential election as a candidate of the Bharatiya Janata Party.',
      'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
    ],
    [
      'Charles III',
      '14 November 1948 ',
      'Charles III is King of the United Kingdom and the 14 other Commonwealth realms. Charles was born in Buckingham Palace during the reign of his maternal grandfather, King George VI, and became heir apparent when his mother, Queen Elizabeth II, acceded to the throne in 1952.',
      'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
    ],
    [
      'Emmanuel Macron',
      '21 December 1977',
      'Emmanuel Jean-Michel Frédéric Macron is a French politician who has been President of France since 2017. Macron is ex officio one of the two Co-Princes of Andorra.',
      'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
    ],
    [
      'Sergio Mattarella',
      '23 July 1941',
      'Sergio Mattarella OMRI OMCA is an Italian politician, jurist, academic, and lawyer who has been President of Italy since 2015. He is the longest-serving president in the history of the Italian Republic. Since Giorgio Napolitano\'s death in 2023, Mattarella has been the only living Italian president.',
      'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
    ],
    [
      'Luiz Inácio Lula da Silva',
      '27 October 1945',
      'Luiz Inácio Lula da Silva, also known as Lula da Silva or simply Lula, is a Brazilian politician who is the 39th and incumbent President of Brazil since 2023. A member of the Workers\' Party, Lula was also the 35th president from 2003 to 2010. He also holds the presidency of the G20 since 2023. ',
      'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
    ],
    [
      'Justin Trudeau',
      '25 December 1971',
      'Trudeau was born in Ottawa and attended Collège Jean-de-Brébeuf. He graduated from McGill University in 1994 with a Bachelor of Arts degree in literature, then in 1998 acquired a Bachelor of Education degree from the University of British Columbia. After graduating he taught at the secondary school level in Vancouver, before relocating back to Montreal in 2002 to further his studies. He was chair for the youth charity Katimavik and director of the not-for-profit Canadian Avalanche Association. In 2006, he was appointed as chair of the Liberal Party\'s Task Force on Youth Renewal.',
      'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
    ],
    [
      'Yoon Suk Yeol',
      '18 December 1960',
      'Yoon Suk Yeol is a South Korean politician who is the 13th and current president of South Korea since 2022. Prior to his presidency, he served as the prosecutor general of South Korea between 2019 and 2021. Born in Seoul, Yoon attended Seoul National University.',
      'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
    ],
    [
      'Pedro Sánchez',
      '29 February 1972 ',
      'Pedro Sánchez Pérez-Castejón is a Spanish politician who has been Prime Minister of Spain since June 2018.',
      'https://s0.rbk.ru/v6_top_pics/resized/590xH/media/img/7/99/756509742968997.jpg',
    ],
  ];

  print('Address wallet: $address');
  print('Balance BNB: ${await web3Client.getBalance(address)}');
  print(
      'Balance USDT: ${(await web3Client.call(sender: address, contract: usdtContract, function: usdtContract.function('balanceOf'), params: [
        address
      ]))[0]}');

  for (var human in humansCapsule) {
    var [name, dataOfbirth, description, imgUrl] = human;
    var response = await web3Client.sendTransaction(
      credentials,
      chainId: int.parse(dotenv.get('CHAIN_ID')),
      Transaction.callContract(
          contract: capsuleContract,
          function: capsuleContract.function('setHuman'),
          parameters: [name, description, imgUrl],
          nonce: Random().nextInt(4294967296)),
    );
    await Future.delayed(Duration(milliseconds: 1500));
    print(response);
    break;
  }

  print('End scrypt');
}
