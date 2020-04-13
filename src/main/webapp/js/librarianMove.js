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
		$("#contents").attr("src","readingroomseatlistmove");
		break;
	case 6:
		$("#contents").attr("src","librarymodifymove");
		break;
	case 7:
		$("#contents").attr("src","libraycalendarmove");
		break;
	case 8:
		$("#contents").attr("src","deliverymanagementmove");
		break;
	case 9:
		$("#contents").attr("src","returnbooksmanagementmove");
		break;
	case 11:
		$("#contents").attr("src","lbhopelist");
		break;	
	case 12:
		$("#contents").attr("src","lbquestionlist");
		break;
	case 13:
		$("#contents").attr("src","mutualloanmove");
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
		$("#contents").attr("src","librarydeletemove");
		break;
	case 3:
		$("#contents").attr("src","librarianinsertmove");
		break;
	case 4:
		$("#contents").attr("src","librarylistmove");
		break;
	case 5:
		$("#contents").attr("src","adminnotice");
		break;
	case 6:
		$("#contents").attr("src","recommendinsertmove");
		break;
	case 7:
		$("#contents").attr("src","recommendlistmove");
		break;
	default:
		break;
	}
	
}
	