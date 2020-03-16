function menuMove(index){

	switch (index) {
	case 1:
		$("#contents").attr("src","libraybooklistmove");
		break;
	case 2:
		$("#contents").attr("src","libraybookinsertmove");
		break;
	case 3:
		
		break;
	case 4:
		$("#contents").attr("src","readingroominsertmove");
		break;
	default:
		break;
	}
	
}

function adminmenuMove(index){

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
	