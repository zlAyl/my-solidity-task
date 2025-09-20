// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Structs {
    
    struct Product {
        uint id;
        string name;
        uint price;
        uint stock;
    }

    mapping(uint => Product) public products;
    uint public productCount;

    function addProducet(string memory _name, uint _price, uint _stock) public   {
        productCount ++;
        products[productCount] = Product(productCount,_name,_price,_stock);
    }

    function delProduct(uint index) public  {
        require(index > 0 && index <= productCount,"too long");
        delete products[index];
    }

    function getProduct(uint _productId) public view returns (string memory, uint, uint) {
        Product storage product = products[_productId];
        return (product.name, product.price, product.stock);
    }


}

contract UserManager {
    
    struct User {
        string name;
        uint8 aage;
        uint balance;
    }
}