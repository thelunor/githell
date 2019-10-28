<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!--Travel Package-->
  <div class="row text-center" id="package">
        <h1>2019 베스트 여행지</h1>
        <div class="col-sm-4">
            <div class="thumbnail">
                <img src="./images/iceland.jpg" alt="iceland" width="300px" height="auto">
                <p><strong>아이슬란드</strong></p>
                <button class="btn" data-toggle="modal" data-target="#myModal_1">감상</button>
            </div>
        </div>
        <div class="col-sm-4">
                <div class="thumbnail">
                    <img src="./images/kota.jpg" alt="kota" width="300px" height="auto">
                    <p><strong>코타키나발루</strong></p>
                    <button class="btn" data-toggle="modal" data-target="#myModal_2">감상</button>
                  </div>
        </div>
        <div class="col-sm-4">
                <div class="thumbnail">
                    <img src="./images/jeju.jpg" alt="jeju" width="300px" height="auto">
                    <p><strong>제주도 왕따나무</strong></p>
                    <button class="btn" data-toggle="modal" data-target="#myModal_3">감상</button>
                  </div>
        </div>
    </div>
    <!-- Book Modal -->
    <div class="modal fade" id="myModal_1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h3><span class="modal-title"></span>코타키나발루</h3>
        </div>
        <div class="modal-body">
          <p>온 세상을 붉게 물들이는 세계 3대 석양, 다양한 해양스포츠를 즐길 수 있는 툰구압둘라만 해양국립공원, 말레이시아 전통생활을 볼 수 있는 민속마을까지 코타키나발루 구석구석을 둘러볼 수 있는 상품으로 전일정 관광 및 식사가 포함되어 있습니다.</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> close
            </button>
            <button type="button" class="btn btn-default pull-right" data-dismiss="modal"
            onclick="open_page('https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=147897375')">
            <span class="glyphicon glyphicon-search"></span> 책정보
            </button>
        </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="myModal_2" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3><span class="modal-title"></span>아이슬란드</h3>
            </div>
            <div class="modal-body">
              <p>대자연의 신비를 간직한 아이슬란드를 일주하는 상품입니다.<br>#아이슬란드 #오로라 #오로라헌팅 #싱벨리어 #레이캬비크 #빙하 #빙산 #간헐천 #골든서클 #싱벨리어 #굴포스 #폭포 #얼음 #블루라군 #온천 #만년설 #유럽여행 #힐링여행 #출사여행 #버킷리스트 #TV속여행지</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
                <span class="glyphicon glyphicon-remove"></span> close
                </button>
                <button type="button" class="btn btn-default pull-right" data-dismiss="modal"
                onclick="open_page('https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=192372285')">
                <span class="glyphicon glyphicon-search"></span> 책정보
            </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModal_3" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3><span class="modal-title"></span>제주도</h3>
            </div>
            <div class="modal-body">
              <p>아름다운 제주에서 현대인의 쓸쓸함에 대해 사색하는 시간</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
                <span class="glyphicon glyphicon-remove"></span> close
                </button>
                <button type="button" class="btn btn-default pull-right" data-dismiss="modal"
                onclick="open_page('https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=171698547')">
                <span class="glyphicon glyphicon-search"></span> 책정보
            </div>
            </div>
        </div>
    </div>