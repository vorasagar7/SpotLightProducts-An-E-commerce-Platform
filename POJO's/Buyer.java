class Buyer implements spotlightUserInterface
{
	private int buyerId;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private boolean isDeleted;
	
	// setter methods
	public void setBuyerID(int buyerId)
	{
		this.buyerId=buyerId;
	}
	public void setFirstName(String firstName)
	{
		this.firstName = firstName;
	}
	public void setLastName(String lastName)
	{
		this.lastName = lastName;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public void setIsDeleted(boolean isDeleted)
	{
		this.isDeleted = isDeleted;
	}
	
	// Getter methods
	public int getBuyerId()
	{
		return this.buyerId;
	}
	public String getFirstName()
	{
		return this.firstName;
	}
	public String getLastName()
	{
		return this.lastName;
		
	}
	public String getEmail()
	{
		return this.email;	
	}
	
	public String getPassword()
	{
		return this.password;
	}
	public boolean getIsDeleted()
	{
		return this.isDeleted;
	}
}
	