//SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Drive {

    constructor() {
        deployer = msg.sender;
    }


    struct Driver {
        string name;
        address payable driverAddress;
        string license;
        string numberPlate;
        bool confirmation;
        int256 fare;
    }

    struct Passenger {
        string name;
        address passengerAddress;
        string phoneNumber;
        bool confirmation;
    }

    struct Ride {
        string pickUp;
        string dropOff;
        int256 fare;
        int256 distance;
    }

    mapping(address => Ride) public rides;
    mapping(address => Driver) public drivers;
    mapping(address => Passenger) public passengers;
    mapping(address => Ride) public activeRequest;
    mapping(address => address) public driverConnection;
    mapping(address => Driver[]) public listDriver;
    mapping(address => int256[]) public price;
    mapping(address => address) public confirmedRides;
    mapping(address => address) public completedRides;

    function registerAsDriver(string memory _name, address payable _driverAddress, string memory _license, string memory _numberPlate, int256 _fare) public {
        // Make sure only the deployer can register a new Driver
        require(msg.sender == deployer, "Only the contract deployer can register a new driver");

        // Create a new Driver struct with the given details and store it in the drivers mapping
        drivers[_driverAddress] = Driver({
        name : _name,
        driverAddress : _driverAddress,
        license : _license,
        numberPlate : _numberPlate,
        confirmation : false,
        fare : _fare
        });
    }


    function registerAsPassenger(string memory _name, string memory _phoneNumber) public {
        // Make sure the caller has not already registered as a Passenger
        require(passengers[msg.sender].passengerAddress == address(0), "You have already registered as a passenger");

        // Create a new Passenger struct with the given details and store it in the passengers mapping
        passengers[msg.sender] = Passenger({
        name : _name,
        passengerAddress : msg.sender,
        phoneNumber : _phoneNumber,
        confirmation : false
        });
    }

    function createActiveRequest(string memory _pickUp, string memory _dropOff, uint256 _distance) public {
        // Make sure the caller has not already created an active request
        require(activeRequest[msg.sender].fare == 0, "You already have an active request");

        // Make sure the requested ride does not already exist in any of the mappings
        require(rides[msg.sender].fare == 0 && confirmedRides[msg.sender] == address(0), "Ride already exists");


        // Store the active request in the activeRequest mapping
        activeRequest[msg.sender] = Ride({
        pickUp : _pickUp,
        dropOff : _dropOff,
        fare : 0,
        distance : _distance
        });
    }


    function negotiatePrice(address _passengerAddress, uint256 _price) public {

        require(drivers[msg.sender] != address(0), "You are not a registered driver");

        // Add the driver to the list of drivers for the passenger's location
        listDriver[_passengerAddress].push(drivers[msg.sender]);

        // Add the price to the list of prices for the passenger's location
        price[_passengerAddress].push(_price);

        // Store the driver's connection to the passenger in the driverConnection mapping
        driverConnection[_passengerAddress] = driver.driverAddress;
    }
}
