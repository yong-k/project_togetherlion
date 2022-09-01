/* paging_noSearching.js */

	// 이전 버튼
	function fn_prev(page, range, rangeSize)
	{
		var page = (range - 1) * rangeSize;
		var range = range - 1;
		
		var url = window.location.href;
		
		// lion이나 lion#로 끝남
		if ((url.slice(-5)).indexOf('lion') != -1)
		{
			url += "?page=" + page;
		}
		// 뒤에 ? 이런식으로 이어짐
		else
		{
			if (url.indexOf('page') != -1)
			{
				url = url.substring(0, url.indexOf('page'));
				url += "page=" + page;
			}
			else
			{
				url += "&page=" + page;
			}
		}
		
		url += "&range=" + range;
		location.href = url;
	}
	
	// 페이지 번호 클릭
	function fn_pagination(page, range, rangeSize)
	{
		var url = window.location.href;
		
		// lion이나 lion#로 끝남
		if ((url.slice(-5)).indexOf('lion') != -1)
		{
			url += "?page=" + page;
		}
		// 뒤에 ? 이런식으로 이어짐
		else
		{
			if (url.indexOf('page') != -1)
			{
				url = url.substring(0, url.indexOf('page'));
				url += "page=" + page;
			}
			else
			{
				url += "&page=" + page;
			}
		}
		
		url += "&range=" + range;
		location.href = url;
	}
	
	// 다음 버튼
	function fn_next(page, range, rangeSize)
	{
		var page = parseInt(range * rangeSize) + 1;
		var range = parseInt(range) + 1;
		
		// lion이나 lion#로 끝남
		if ((url.slice(-5)).indexOf('lion') != -1)
		{
			url += "?page=" + page;
		}
		// 뒤에 ? 이런식으로 이어짐
		else
		{
			if (url.indexOf('page') != -1)
			{
				url = url.substring(0, url.indexOf('page'));
				url += "page=" + page;
			}
			else
			{
				url += "&page=" + page;
			}
		}
		
		url += "&range=" + range;
		location.href = url;
	}