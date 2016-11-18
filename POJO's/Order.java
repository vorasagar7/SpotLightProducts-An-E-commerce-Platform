class Order
{
	private int buyerId;
	private int orderId;
	private int sellerId;
	private int modeOfPaymentId;
	private String shippingAddress;
	private boolean isDeleted;
	
	public int getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getModeOfPaymentId() {
		return modeOfPaymentId;
	}
	public void setModeOfPaymentId(int modeOfPaymentId) {
		this.modeOfPaymentId = modeOfPaymentId;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public boolean getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

}
