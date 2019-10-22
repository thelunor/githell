
function resultCom(txt) {
    var name = txt.name.value; //이름
    var comments = txt.comments.value; //방명록
    document.textR.result.value += "♥ " + name + "  -  " + comments + "\n";
}

function myMap() {
    var bit = new google.maps.LatLng(37.4994553, 127.0270584);
    //맵 정보
    var mapProp = {
        center: bit,
        zoom: 18,
    };

    //맵 요청
    var map = new google.maps.Map(document
        .getElementById("map"), mapProp);

    //마커 표시
    var marker = new google.maps.Marker({
        position: bit
    });
    marker.setMap(map);
    //InfoWindow
    var infowindow = new google.maps.InfoWindow(
        {
            content: "<div><strong>비트캠프 강남센터</strong></div>"
        });
    infowindow.open(map, marker);
}
