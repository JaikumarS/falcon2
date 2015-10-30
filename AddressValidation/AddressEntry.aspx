<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressEntry.aspx.cs" Inherits="AddressValidation.AddressEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

   <link type="text/css" rel="stylesheet" href ="http://fonts.googleapis.com/css?family=Roboto:300,400,500" />

     <link type="text/css" rel="stylesheet" href ="main.css" />

    <script src="http://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>

    <style >

      input[type="text"] {
            border-radius: 0;
            border: 2px solid transparent;
            min-height: auto !important;
            padding: 12px 10px;
            box-shadow: none !important;
            background-color: #ecedee;
        }
        .pac-logo::after, .pac-icon
        {
            background-image:none !important;
          
        }

    </style>

    <script>

        var placesearch, autocomplete;
        function init() {
            autocomplete = new google.maps.places.Autocomplete(
               document.getElementById('addrLine'),
                {
                    types:['geocode']

                });

            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                var place = autocomplete.getPlace();
                // alert(place.geometry.location.A);

              //  document.getElementById('Text1').value = place.geometry.location;
                //alert(place.geometry.location);
                
                for (var j = 0; j < place.address_components.length; j++) {
                    if ("postal_code" == place.address_components[j].types[0]) {

                        document.getElementById('zip').value = place.address_components[j]['short_name'];
                    }
                }
           });


        }


    </script>

    <title>Smart Address Validation</title>

</head >

<body onload="init();">
    <form id="form1">

      <!--   <input type="text" id="txtaddress" style="width:650px" />
        <input type="text" id="zipcode" style="width:150px" /> -->
      
      <section class="newServ">
    <div id="AddresEntry" style="padding-left: 20px; padding-right: 20px;">
        <div class=" sectionpadding LQ padt0">

            <h3 style="line-height: 1.1;font-size: 1.6em;margin-top:0;">Enter your Location and Pick from List
            <div id="newService"  style="padding-top:15px;">
                <div class="row-fluid mt15 newAddress">

                    <div class="stDiv span6">

                       
                        <input class="stFld span12" type="text" name="addrLine" style="width:550px;"  id="addrLine" placeholder="Business Address" maxlength="100">

                    </div>
                    <div class="zipDiv span6" style="padding-top:15px;">
                       
                        <input class="zipFld" type="text" name="zip" style="width:150px;" id="zip" placeholder="Zip Code" style="width:60px;" maxlength="5">
                     
                    </div>




                </div>

            </div>

          
        </div>
    </div>
</section>

    </form>
</body>

</html>