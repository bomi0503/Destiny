package com.destiny.common;


//==>����Ʈȭ���� �𵨸�(�߻�ȭ/ĸ��ȭ)�� Bean 
public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	private String searchSortingOption;
	private String currentTranCode;
	private String sortingProdName;
	private String sortingRegDate;
	//==> ����Ʈȭ�� currentPage�� �ش��ϴ� ȸ�������� ROWNUM ��� SELECT ���� �߰��� Field 
	//==> UserMapper.xml �� 
	//==> <select  id="getUserList"  parameterType="search"	resultMap="userSelectMap">
	//==> ����
	private int endRowNum;
	private int startRowNum;
	//��ȸ�� ����
	private String viewSort;
	//������ ����
	private String likeSort;
	//�۹�ȣ ����
	private String noSort;
	
	
	///Constructor
	public Search() {
	}
	
	///Method
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	//==> Select Query �� ROWNUM ������ �� 
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	//==> Select Query �� ROWNUM ���� ��
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}
	
	public String getSearchSortingOption() {
		return searchSortingOption;
	}

	public void setSearchSortingOption(String searchSortingOption) {
		this.searchSortingOption = searchSortingOption;
	}

	
	public String getCurrentTranCode() {
		return currentTranCode;
	}

	public void setCurrentTranCode(String currentTranCode) {
		this.currentTranCode = currentTranCode;
	}

	
	public String getSortingProdName() {
		return sortingProdName;
	}

	public void setSortingProdName(String sortingProdName) {
		this.sortingProdName = sortingProdName;
	}

	
	public String getSortingRegDate() {
		return sortingRegDate;
	}

	public void setSortingRegDate(String sortingRegDate) {
		this.sortingRegDate = sortingRegDate;
	}

	
	
	public String getViewSort() {
		return viewSort;
	}

	public void setViewSort(String viewSort) {
		this.viewSort = viewSort;
	}

	public String getLikeSort() {
		return likeSort;
	}

	public void setLikeSort(String likeSort) {
		this.likeSort = likeSort;
	}
	
	

	public String getNoSort() {
		return noSort;
	}

	public void setNoSort(String noSort) {
		this.noSort = noSort;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", pageSize=" + pageSize + ", searchSortingOption=" + searchSortingOption
				+ ", currentTranCode=" + currentTranCode + ", sortingProdName=" + sortingProdName + ", sortingRegDate="
				+ sortingRegDate + ", endRowNum=" + endRowNum + ", startRowNum=" + startRowNum + ", viewSort="
				+ viewSort + ", likeSort=" + likeSort + ", noSort=" + noSort + "]";
	}

	

	

}