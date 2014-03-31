var draw_customers = (function (my_map) {
    var customers = [
        {id: 15, name: "bob", coords: [53.316, -6.2278]}
    ];

    for (var i in customers) {
        var customer = customers[i];
        var marker_options = {
            position: new google.maps.LatLng(
                customer.coords[0],
                customer.coords[1]
            ),
            icon: {
                path: google.maps.SymbolPath.CIRCLE,
                fillColor: "#ff0000",
                fillOpacity: 0.5,
                strokeColor: "#ff0000",
                strokeWeight: 1.8,
                scale: 4
            },
            map: my_map
        };

        var marker = new google.maps.Marker(marker_options);
    }
});


var draw_map = (function (position) {
    var map_options = {
        center: new google.maps.LatLng(
            position.coords.latitude,
            position.coords.longitude
        ),
        zoom: 12,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var my_map = new google.maps.Map(
        document.getElementById("my_google_map"),
        map_options
    );

    draw_customers(my_map);
});


$(document).on("ready", function () {
    navigator.geolocation.getCurrentPosition(draw_map);
});
