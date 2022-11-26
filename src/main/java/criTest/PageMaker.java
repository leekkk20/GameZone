package criTest;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.ToString;

// ** View에 필요한 값을 완성
// => Criteria를 이용해서!

@Getter
@ToString
public class PageMaker {

	private int totalRowsCount; // 전체 Row 개수 (전체 Page 수를 계산하기 위해 필요함)
	private int spageNo; // view에 표시할 첫 PageNo.
	private int epageNo; // view에 표시할 끝 PageNo.
	private int displayPageNo = 3; // 1 Page당 표시할 pageNo 개수
	private int lastPageNo;
	// => 출력 가능한 마지막 PageNo (totalRowCount, rowsPerPage로 계산)
	
	private boolean prev; // 이전 PageBlock으로 이동
	private boolean next; // 다음 PageBlock으로 이동
	
	//private Criteria cri; // *ver01 - private 변수로 정의해서 Criteria 이용
	private SearchCriteria cri; // *ver02
	
	
	// ** 필요한 값 set
	// 1) Criteria : ver01 / SearchCriteria : ver02
	
	//public void setCri(Criteria cri) { // ver01
	public void setCri(SearchCriteria cri) { // ver02
		this.cri = cri;
	}
	
	// 2) totalRowCount
	public void setTotalRowsCount(int totalRowsCount) {
		this.totalRowsCount = totalRowsCount;
		calcData();
	} // setTotalRowsCount
	
	// 3) 위 외에 필요한 값 계산
	// => totalRowsCount를 이용해서
	//    spageNo, epageNo, prev, next, lastPageNo 계산
	public void calcData() {
		
		// 3-1) currPage가 속한 페이지블럭의 epageNo 계산
		
		epageNo = (int)Math.ceil(cri.getCurrPage() / (double)displayPageNo) * displayPageNo;
	    spageNo = (epageNo - displayPageNo) + 1 ;
		
	    
		// 3-2) lastPageNo 계산, epageNo 확인 => epageNo이 lastPageNo에 맞는지 확인
	    lastPageNo = (int)Math.ceil(totalRowsCount / (double)cri.getRowsPerPage());
	    if (epageNo > lastPageNo)
	    	epageNo = lastPageNo;
		
		
		// 3-3) prev, next
		prev = spageNo == 1 ? false : true; // 처음 페이지가 1이 아닐 때 true
		next = epageNo == lastPageNo ? false : true; // 마지막 페이지가 맨 마지막 페이지가 아닐 때 true
		
	} // calcData
	
	// 4) QueryString 만들기
	public String makeQuery(int currPage) {
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance().
				queryParam("currPage", currPage).
				queryParam("rowsPerPage", cri.getRowsPerPage()).
				build();
		
		return uriComponents.toString(); // UriComponents Type이기 때문에 .toString()으로 type 변경
		
	} // makeQuery

//------------------------------------------------------------------------------------------------------
	
	// ** ver02
	// => uri에 search 기능 추가 (Paging 시에도 조건이 유지되도록 해줘야 함)
	public String searchQuery(int currPage) {
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance().
				queryParam("currPage", currPage).
				queryParam("rowsPerPage", cri.getRowsPerPage()).
				queryParam("searchType", cri.getSearchType()).
				queryParam("keyword", cri.getKeyword()).
				build();
				
		return uriComponents.toString();
		
	} // searchQuery
	
} // class
