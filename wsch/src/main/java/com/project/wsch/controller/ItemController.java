package com.project.wsch.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.wsch.vo.ItemVO;

// 클라이언트 아이디 9oqm9xhcpr
// 클라이언트 시크릿 ZMEsBmN8g9Yhfr8AiLWRqsWT32LtS1975XtXJoHW

@Controller
public class ItemController {
	public List<ItemVO> getData() {
		List<ItemVO> products = new ArrayList<ItemVO>();
		
		// 임시 데이터
		ItemVO p1 = new ItemVO("https://thesool.com/common/imageView.do?targetId=PR00001165&targetNm=PRODUCT"
				,"달 15%", "청주", "15%", "375ml"
				, "쌀(화성시), 누룩(국내산), 정제수"
				, "술로우"
				,"은은한 단맛과 산미가 조화로우며,풍부한 꽃향기와 깔끔한 피니쉬가 특징입니다.", 0);
		ItemVO p2 = new ItemVO("https://thesool.com/common/imageView.do?targetId=PR00001164&targetNm=PRODUCT"
				,"사일로 막걸리", "탁주", "10%", "500ml"
				, "찹쌀(국내산), 멥쌀(국내산), 개량누룩, 정제수"
				, "사일로 브루어리"
				, "사일로 막걸리는 3번의 담금 과정을 거친 삼양주입니다. 원재료 이외의 어떠한 첨가물도 들어가지 않은 막걸리입니다.", 1);
		ItemVO p3 = new ItemVO("https://thesool.com/common/imageView.do?targetId=PR00001163&targetNm=PRODUCT"
				,"비왈츠 로지", "청주", "15%", "375ml"
				, "쌀(화성시), 누룩(국내산), 정제수"
				, "술로우"
				,"은은한 단맛과 산미가 조화로우며,풍부한 꽃향기와 깔끔한 피니쉬가 특징입니다.", 2);
		ItemVO p4 = new ItemVO("https://thesool.com/common/imageView.do?targetId=PR00001165&targetNm=PRODUCT"
				,"달 15%", "청주", "15%", "375ml"
				, "쌀(화성시), 누룩(국내산), 정제수"
				, "술로우"
				,"은은한 단맛과 산미가 조화로우며,풍부한 꽃향기와 깔끔한 피니쉬가 특징입니다.", 3);
		ItemVO p5 = new ItemVO("https://thesool.com/common/imageView.do?targetId=PR00001165&targetNm=PRODUCT"
				,"달 15%", "청주", "15%", "375ml"
				, "쌀(화성시), 누룩(국내산), 정제수"
				, "술로우"
				,"은은한 단맛과 산미가 조화로우며,풍부한 꽃향기와 깔끔한 피니쉬가 특징입니다.", 4);
		ItemVO p6 = new ItemVO("https://thesool.com/common/imageView.do?targetId=PR00001165&targetNm=PRODUCT"
				,"달 15%", "청주", "15%", "375ml"
				, "쌀(화성시), 누룩(국내산), 정제수"
				, "술로우"
				,"은은한 단맛과 산미가 조화로우며,풍부한 꽃향기와 깔끔한 피니쉬가 특징입니다.", 5);
		
		
		
		products.add(p1);
		products.add(p2);
		products.add(p3);
		products.add(p4);
		products.add(p5);
		products.add(p6);
		
		return products;

	}
	
	
	@GetMapping("/items")
	public ModelAndView itemlist() {
		ModelAndView mav = new ModelAndView("/items/itemlist");
		
		
		mav.addObject("products", getData());

		return mav;
	}
	
	
	
	@GetMapping("/items/detail")
	public ModelAndView detail() {
		ModelAndView mav = new ModelAndView("/items/detail");
		mav.addObject("products", getData());
		
		return mav;
	}
}


/*
 데이터
	            <div class="item">
	                <div class="image">
	                    <a href="#">
	                        <img class="img" src=>
	                    </a>
	                </div>
	                <div class="information">
	                    <div class="title"></div>
	                    <div class="review">평점 3.5 리뷰 4</div>
	                    <div class="detail">
	                        <ul class="menuUl">
	                            <hr/>
	                            <li>	
	                                비왈츠 로지는 국내 최초로 만들어진 로도멜(미드+장미 꽃잎)입니다. 춘천에서 양봉한 아카시아 벌꿀과 유기농 장미가 들어가 싱그럽고 달콤한 맛을 극대화했습니다.
	                            </li>
	                            <hr/>
	                            <li>분류        리큐르</li>
	                            <li>제조사      미더리봉자</li>
	                            <li>주 원료     벌꿀(국산), 유기농건조장미잎(국산), 정제수, 효모, 효모영양제, 구연</li>
	                            <li>규격/도수   500ml / 8%    </li>
	                           
	                        </ul>
	                    </div>
	                </div>
	            </div>
	
	            <div class="item">
	                <div class="image">
	                    <a href="#">
	                        <img class="img" src="https://thesool.com/common/imageView.do?targetId=PR00001162&targetNm=PRODUCT">
	                    </a>
	                </div>
	                <div class="information">
	                    <div class="title">모을동주 소주</div>
	                    <div class="review">평점 3.5 리뷰 4</div>
	                    <div class="detail">
	                        <ul class="menuUl">
	                            <hr/>
	                            <li>	
	                                주정에 감미료를 타서 만든 저렴한 희석식 소주가 아닌, 술덧을 증류한 그대로를 담은 오리지널 증류식 소주입니다.
	                            </li>
	                            <hr/>
	                            <li>분류        증류주</li>
	                            <li>제조사      대작영농조합법인</li>
	                            <li>주 원료     물, 쌀(철원군), 국, 효모, 밀함유</li>
	                            <li>규격/도수   500ml / 10%  </li>
	
	                        </ul>
	                    </div>
	                </div>
	            </div>
	
	            <div class="item">
	                <div class="image">
	                    <a href="#">
	                        <img class="img" src="https://thesool.com/common/imageView.do?targetId=PR00001161&targetNm=PRODUCT">
	                    </a>
	                    </div>
	                <div class="information">
	                    <div class="title">청춘7도</div>
	                    <div class="detail">
	                        <ul class="menuUl">
	                            <hr/>
	                            <li>	
	                                비왈츠 로지는 국내 최초로 만들어진 로도멜(미드+장미 꽃잎)입니다. 춘천에서 양봉한 아카시아 벌꿀과 유기농 장미가 들어가 싱그럽고 달콤한 맛을 극대화했습니다.
	                            </li>
	                            <hr/>
	                            <li>분류        탁주-막걸리</li>
	                            <li>제조사      사일로 브루어리</li>
	                            <li>주 원료     찹쌀(국내산), 멥쌀(국내산), 개량누룩, 정제수</li>
	                            <li>규격/도수   500ml / 10%  </li>
	
	                        </ul>
	                    </div>
	                </div>
	            </div>
	
	            <div class="item">
	                <div class="image">
	                    <a href="#">
	                        <img class="img" src="https://thesool.com/common/imageView.do?targetId=PR00001160&targetNm=PRODUCT">
	                    </a>
	                </div>
	                <div class="information">
	                    <div class="title">하늘아래서</div>
	                    <div class="detail">
	                        <ul class="menuUl">
	                            <hr/>
	                            <li>	
	                                비왈츠 로지는 국내 최초로 만들어진 로도멜(미드+장미 꽃잎)입니다. 춘천에서 양봉한 아카시아 벌꿀과 유기농 장미가 들어가 싱그럽고 달콤한 맛을 극대화했습니다.
	                            </li>
	                            <hr/>
	                            <li>분류        탁주-막걸리</li>
	                            <li>제조사      사일로 브루어리</li>
	                            <li>주 원료     찹쌀(국내산), 멥쌀(국내산), 개량누룩, 정제수</li>
	                            <li>규격/도수   500ml / 10%  </li>
	
	                        </ul>
	                    </div>
	                </div>
	            </div>
	
	
	            <div class="item">
	                <div class="image">
	                    <a href="#">
	                        <img class="img" src="https://thesool.com/common/imageView.do?targetId=PR00001165&targetNm=PRODUCT">
	                    </a>
	                </div>
	                <div class="information">
	                    <div class="title">달 15%</div>
	                    <div class="detail">
	                        <ul class="menuUl"> 
	                            <hr/>
	                            <li>	
	                                은은한 단맛과 산미가 조화로우며,풍부한 꽃향기와 깔끔한 피니쉬가 특징입니다.
	                            </li>
	                            <hr/>
	                            <li>분류        청주</li>
	                            <li>제조사      술로우</li>
	                            <li>주 원료     쌀(화성시), 누룩(국내산), 정제수</li>
	                            <li>규격/도수   375ml / 15%    </li>
	                           
	
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </div>
 */
