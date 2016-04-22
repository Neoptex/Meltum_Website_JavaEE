package com.meltum.service.IService;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.json.JSONException;

import com.meltum.beans.Company;
import com.meltum.model.forms.MyCompanyForm;

public interface ICompanyService {

	Company createCompany(MyCompanyForm companyForm) throws JsonGenerationException, JsonMappingException, JSONException, IOException;

	Company updateCompany(MyCompanyForm companyForm) throws JsonGenerationException, JsonMappingException, JSONException, IOException;

	Company getCompanyById(MyCompanyForm companyForm);

	Company getCompanyByUser();

}