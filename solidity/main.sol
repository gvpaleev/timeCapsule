// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Импорт интерфейса ERC-20
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TimeCapsule {
    address private _owner;
    struct Comment {
        uint256 id;
        string text;
    }
    struct Human {
        uint256 id;
        string name;
        string description;
        string urlIcon;
        uint256[] commentsId;
    }

    modifier onlyOwner() {
        require(msg.sender == _owner, "Not the owner");
        _; // Продолжаем выполнение функции, если проверка успешна
    }

    uint256 commentId = 0;
    struct Comment {
        uint256 id;
        // uint256 idHuman;
        string text;
    }

    // Структура записи
    uint256 humanId = 0;
    struct Human {
        uint256 id;
        string name;
        string description;
        string urlIcon;
        uint256[] commentsId;
    }

`   mapping (uint256 => string) persons;
    // Массив для хранения записей
    Comment[] private comments;
    Human[] public  humans;
    
    address usdtAddress = address(0xcA9E56F2f817e27bED23FEFa0208CC3da60A5e6D);

    

    constructor() {
        // usdtAddress = _usdtAddress;
        _owner = msg.sender;
    }
    function setHuman(         
        string memory _name,
        string memory _description,
        string memory _urlIcon
        )public onlyOwner {
            humans.push(Human(
               { id: humanId,
                name: _name,
                description: _description,
                urlIcon: _urlIcon,
                commentsId: new uint256[](0)
                }
            ));
            humanId++;
        }

    function setComment(         

        uint256 _humanId,
        string memory _text
    )public{
        
        comments.push(Comment(
           { id: commentId,
            text: _text
            }
        ));
        humans[_humanId].commentsId.push(commentId);
        commentId++;
    }
   
    // Функция для получения количества записей
    function getHumanCount() public view returns (uint) {
        return humans.length;
    }
    
    function getCommentsCount(uint256 id) public view returns (uint) {
        return humans[id].commentsId.length;
    }

    function getComentsForHuman(uint256 id) public view returns (string[] memory) {
         // Определение размера массива с учетом количества элементов в humans[id].commentsId
    string[] memory data = new string[](humans[id].commentsId.length);

    // Копирование элементов из humans[id].commentsId в data
    for (uint i = 0; i < humans[id].commentsId.length; i++) {
        data[i] = comments[humans[id].commentsId[i]].text;
    }

    return data;
    }
}
