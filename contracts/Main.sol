//SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Drive{

    struct Driver{
        string name;
        address payable driverAddress;
        string license;
        string numberPlate;
        bool confirmation;
        int256 fare;
    }

    struct Passenger{
        string name;
        address passengerAddress;
        string phoneNumber;
        bool confirmation;
    }

    struct Ride{
        string pickUp;
        string dropOff;
        int256 fare;
    }
    mapping(uint=>Ride) public rides;
    mapping(uint=>Driver) public drivers;
    mapping(uint=>Passenger) public passengers;
    uint public nextDriverId;
    uint public nextPassengerId;
    uint public nextRideId;


    function addDriver(string memory _name, address payable _address, string memory _license, string memory _numberPlate) public {
        drivers[nextDriverId] = Driver(_name, _address, _license, _numberPlate, false, 0);
        nextDriverId++;
    }

    function addPassenger(string memory _name, string memory _phoneNumber) public {
        passengers[nextPassengerId] = Passenger(_name, msg.sender, _phoneNumber, false);
        nextPassengerId++;
    }

    function setPassengerConfirmation(uint passengerId) public {
        passengers[passengerId].confirmation = true;
    }
    function setDriverConfimation(uint driverId) public{
        drivers[driverId].confirmation = true;
    }

    function offerFare(uint driverId, int256 _fare) public{
        drivers[driverId].fare = _fare;
    }

    function showEligibleDrivers() public returns (address){
        uint temp = 0;
        for(temp = 0; temp<10; temp++){
            if(drivers[temp].fare>0){
                return drivers[temp].driverAddress;
            }
        }
    }

    function startRide(uint passengerId, uint driverId, string memory _pickUp, string memory _dropOff, int256 _fare) public{
        require(passengers[passengerId].confirmation == true, "Passenger not ready yet.");
        require(drivers[driverId].confirmation == true, "Driver not ready yet.");
        rides[nextRideId] = Ride(_pickUp, _dropOff, _fare);

    }
    function transfer(address payable to) external payable{
		to.transfer(msg.value);
	}
}
