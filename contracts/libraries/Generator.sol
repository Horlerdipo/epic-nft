//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;


contract Generator{

    string internal baseSvg =
        "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: white; font-family: serif; font-size: 24px; }</style><rect width='100%' height='100%' fill='";

    string internal svgPartTwo = "'/><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";

    string[] internal colors = ["red", "#08C2A8", "black", "yellow", "blue", "green"];

    string[] internal firstWords = [
        "Sasuke",
        "Naruto",
        "Jiraiya",
        "YOUR_WORD",
        "Itachi",
        "Minato",
        "Gaara",
        "Obito",
        "Nagato",
        "Kabuto"
    ];
    
    string[] internal secondWords = [
        "Aburame Clan"
        "Akimichi Clan",
        "Amagiri Clan",
        "Chinoike Clan",
        "Fuma Clan",
        "Fuma Clan (Land of Sound)",
        "Funato Clan",
        "Hagoromo Clan",
        "Hatake Clan",
        "Hirasaka Clan",
        "Hoki Family",
        "Hoshigaki Clan"
        "Hozuki Clan",
        "Hyuga Clan",
        "Iburi Clan",
        "Inuzuka Clan",
        "Izuno Clan",
        "Jugo's Clan",
        "Kagetsu Family",
        "Kaguya Clan",
        "Kamizuru Clan",
        "Karatachi Family",
        "Kazekage Clan",
        "Kedoin Clan",
        "Kodon Clan",
        "Kohaku Clan",
        "Kumanoi Clan",
        "Kurama Clan",
        "Lee Clan",
        "Nara Clan",
        "Onikuma Clan",
        "Otsutsuki Clan",
        "Rinha Clan",
        "Ryu Clan",
        "Sarutobi Clan",
        "Sendo Clan",
        "Senju Clan",
        "Shiin Clan",
        "Shimura Clan",
        "Shirogane Clan",
        "Taketori Clan",
        "Tenro Clan",
        "Tsuchigumo Clan",
        "Uchiha Clan",
        "Uzumaki Clan",
        "Uzumaki Clan",
        "Wagarashi Family",
        "Wasabi Family",
        "Yamanaka Clan",
        "Yoimura Clan",
        "Yota's Clan"
    ];

}

