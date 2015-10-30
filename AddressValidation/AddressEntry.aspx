<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressEntry.aspx.cs" Inherits="AddressValidation.AddressEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

   <link type="text/css" rel="stylesheet" href ="http://fonts.googleapis.com/css?family=Roboto:300,400,500" />

    <script src="http://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>

    <style >
        .pac-logo::after, .pac-icon
        {
            background-image:none !important;
          
        }

    </style>

    <script>

        var placesearch, autocomplete;
        function init() {
            autocomplete = new google.maps.places.Autocomplete(
               document.getElementById('txtaddress'),
                {
                    types:['geocode']

                });

            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                var place = autocomplete.getPlace();
                // alert(place.geometry.location.A);

                document.getElementById('Text1').value = place.geometry.location;
                //alert(place.geometry.location);
                
                for (var j = 0; j < place.address_components.length; j++) {
                    if ("postal_code" == place.address_components[j].types[0]) {

                        document.getElementById('zipcode').value = place.address_components[j]['short_name'];
                    }
                }
           });


        }


    </script>

    <title>Smart Address Validation</title>

</head >

<body onload="init();">
    <form id="form1">

         <input type="text" id="txtaddress" style="width:650px" />
        <input type="text" id="zipcode" style="width:150px" />
       <br />
          <input type="text" id="Text1" style="width:250px" />


    </form>
</body>

</html>