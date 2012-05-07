function autoFillContactInfo() {
    var x=document.forms[1];                   //Select the form

    //Fill out Contact Information
    x.elements[3].value = "John";               //First Name
    x.elements[4].value = "Doe";                //Last Name
    x.elements[5].value = "3333 Third Row";     //Address 1
    x.elements[6].value = "#33";                //Address 2
    x.elements[7].value = "Dallas";             //City
    x.elements[8].value = "TX";                 //State
    x.elements[9].value = "77777";              //Postal Code
    x.elements[10].value = "USA";                //Country
    x.elements[11].value = "555-555-5555";       //Phone #
    x.elements[12].value = "jd@email.com";      //Email Address

    //Fill out Payment Information
    x.elements[13].value = "Visa";               //Credit Card type
    x.elements[14].value = "1234123412341234";  //Credit Card Number
    x.elements[15].value = "12";                //Credit Card Exp Month
    x.elements[16].value = "2020";               //Credit Card Exp Year
    x.elements[17].value = "321";               //Credit Card CV Code
}
