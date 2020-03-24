function menuMove(index){ //사서 페이지 메뉴 이동 메소드

	switch (index) {
	case 1:
		$("#contents").attr("src","libraybooklistmove");
		break;
	case 2:
		$("#contents").attr("src","libraybookinsertmove");
		break;
	case 3:
		$("#contents").attr("src","readingroomlistmove");
		break;
	case 4:
		$("#contents").attr("src","readingroominsertmove");
		break;
	case 5:
		
		break;
	case 6:
		$("#contents").attr("src","librarymodifymove");
		break;
	case 7:
		$("#contents").attr("src","libraycalendarmove");
		break;
		
	case 12:
		$("#contents").attr("src","lbquestionlist");
		break;
		
		
	default:
		break;
	}
	
}

function adminmenuMove(index){ //관리자 페이지 메뉴 이동 메소드

	switch (index) {
	case 1:
		$("#contents").attr("src","libraryinsertmove");
		break;
	case 2:
		$("#contents").attr("src","");
		break;
	case 3:
		$("#contents").attr("src","librarianinsertmove");
		break;
	case 4:
		$("#contents").attr("src","librarylistmove");
		break;
	default:
		break;
	}
	
}
	