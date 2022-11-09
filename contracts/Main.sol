// SPDX-License-Identifier: MIT

pragma solidity >=0.4.3 <0.9.0;

contract Main {

  struct eligibleDrivers {
      address[] drivers;
      uint256 amount;
      address payable finalDriver;
      bool userConfirmation;
      bool driverConfirmation;
      
  }
  
  mapping(address => eligibleDrivers) driverTable; 

  function startJourney(address payable _driver, address _user) public {
      driverTable[_user].finalDriver = _driver;
      driverTable[_user].driverConfirmation = true;
      driverTable[_user].userConfirmation = true;      
      emit JourneyStarted(true);
  }


  function endJourney(address _user) public payable {
      require (driverTable[_user].userConfirmation == true);
      require (driverTable[_user].driverConfirmation == true);
      require (address(this).balance >= driverTable[_user].amount);
      driverTable[_user].finalDriver.transfer(driverTable[_user].amount);
      driverTable[_user].userConfirmation == false;
      driverTable[_user].driverConfirmation == false;    
      emit JourneyEnded(false);
  }
  event JourneyStarted(bool status);
  event JourneyEnded(bool status);

    function transfer(address payable to)
	external payable
	{
		to.transfer(msg.value);
	}

}