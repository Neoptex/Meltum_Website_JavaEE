package com.meltum.beans;

public class Statistic
{
    String id;
    String elemId;
    String type;
    String name;
    int usedAmount;
    float earnAmount;
    
    public String getId()
    {
        return id;
    }
    public void setId(String id)
    {
        this.id = id;
    }
    public String getElemId()
    {
        return elemId;
    }
    public void setElemId(String elemId)
    {
        this.elemId = elemId;
    }
    public String getType()
    {
        return type;
    }
    public void setType(String type)
    {
        this.type = type;
    }
    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    public int getUsedAmount()
    {
        return usedAmount;
    }
    public void setUsedAmount(int usedAmount)
    {
        this.usedAmount = usedAmount;
    }
    public float getEarnAmount()
    {
        return earnAmount;
    }
    public void setEarnAmount(float earnAmount)
    {
        this.earnAmount = earnAmount;
    }
}
