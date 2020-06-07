package com.team3.paging;

public class bpageinfo {
	private boolean preve;
    private boolean next;
    private int startPage = 1;
    private int endPage;
    private int currentPage;
    private int boardSize=10;
    private int startRow;
    private int listCount;
    private int allPage;
    
    public int getBoardSize() {
    	return boardSize;
    }
    
    public int getStartRow() {
        return startRow;
    }

    public int getCurrentPage() {
    	return currentPage;
    }
    
    public int getListCount() {
    	return listCount;
    }

    public int getEndPage() {
    	return endPage;
    }

    public int getStartPage() {
    	return startPage;
    }

    public int getAllPage() {
    	return allPage;
    }
    
    public void setBoardSize(int boardSize) {
    	this.boardSize = boardSize;
    }
    
    public void setStartRow(int currentPage) {
    	this.startRow = (currentPage - 1) * boardSize;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public void setListCount(int listCount) {
        this.listCount = listCount;
    }
    
    public void setEndPage(int currentPage, int allPage) {
    	if(currentPage == 1) {
    		if(allPage < 5) {
    			this.endPage = allPage;
    		} else {
    			this.endPage = currentPage + 4;
    		}
    	}else if(currentPage == 2){
    		if(allPage < 5) {
    			this.endPage = allPage;
    		} else {
    			this.endPage = currentPage + 3;
    		}
    	}else if(currentPage >= allPage-2){
    		this.endPage = allPage;
    	}else {
    		this.endPage = currentPage + 2;
    	}
    }
       
    public void setStartPage(int currentPage, int allPage) {
    	if(currentPage > 3 && currentPage < allPage-1) {
    		this.startPage = currentPage - 2;
    		
    		
    	} else if(currentPage >= allPage-1){
    		if(allPage < 5) {
    			this.startPage = 1;
    		} else {
    			this.startPage = allPage-4;
    		}
    		
    	} else {
    		this.startPage = 1;
    	}
    }
    
    public void setAllPage(int listCount) {
    	if(listCount==0) {
    		listCount = 1;
    	}
        if((listCount % boardSize) == 0) {
        	this.allPage = listCount / boardSize ;
        } else {
            this.allPage = (listCount / boardSize) + 1;
        }
    }
    
    public void setPreve(int currentPage) {
    	if(currentPage == 1) {
    		this.preve = false;
    	} else {
    		this.preve = true;
    	}
    }

    public void setNext(int currentPage, int allPage) {
    	if(currentPage == allPage ) {
    		this.next = false;
    	} else {
    		this.next = true;
    	}
    }

    public boolean isPreve() {
        return preve;
    }
    
    public boolean isNext() {
        return next;
    }
     
	@Override
	public String toString() {
		return "pageinfo [preve=" + preve + ", next=" + next + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", currentPage=" + currentPage + ", boardSize=" + boardSize + ", startRow=" + startRow
				+ ", listCount=" + listCount + ", allPage=" + allPage + "]";
	}
}
