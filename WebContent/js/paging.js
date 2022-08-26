/* paging.js */

	// 검색
	$(function()
	{
		$('#btnNavbarSearch').click(function(e)
		{
			e.preventDefault();
			var url = window.location.pathname;
			url += "?searchType=" + $('#searchType').val();
			url += "&keyword=" + $('#keyword').val();
			
			location.href = url;
		});
	});
	

	// 이전 버튼
	function fn_prev(page, range, rangeSize)
	{
		var page = (range - 1) * rangeSize;
		var range = range - 1;
		
		var url = window.location.pathname;
		url += "?page=" + page;
		url += "&range=" + range;
		url += "&searchType=" + $('#searchType').val();
		url += "&keyword=" + $('#keyword').val();
		
		location.href = url;
	}
	
	// 페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword)
	{
		var url = window.location.pathname;
		url += "?page=" + page;
		url += "&range=" + range;
		url += "&searchType=" + $('#searchType').val();
		url += "&keyword=" + $('#keyword').val();
		
		location.href = url;
	}
	
	// 다음 버튼
	function fn_next(page, range, rangeSize)
	{
		var page = parseInt(range * rangeSize) + 1;
		var range = parseInt(range) + 1;
		
		var url = window.location.pathname;
		url += "?page=" + page;
		url += "&range=" + range;
		url += "&searchType=" + $('#searchType').val();
		url += "&keyword=" + $('#keyword').val();
		
		location.href = url;
	}