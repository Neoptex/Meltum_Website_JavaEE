package com.meltum.service.IService;

import java.util.List;

import com.meltum.beans.Melt;
import com.meltum.model.forms.MeltForm;

public interface IMeltService {

	Melt createMelt(MeltForm form);

	List<Melt> getMelts();
	
	public Melt updateMelt(MeltForm form);
	
	public Melt removeMelt(MeltForm form);
	
}
