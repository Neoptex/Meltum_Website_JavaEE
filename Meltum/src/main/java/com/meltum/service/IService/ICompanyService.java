package com.meltum.service.IService;

import com.meltum.beans.Company;
import com.meltum.model.forms.MyCompanyForm;

public interface ICompanyService {

	Company createCompany(MyCompanyForm companyForm);

	Company updateCompany(MyCompanyForm companyForm);

	Company getCompanyById(MyCompanyForm companyForm);

	Company getCompanyByUser();

}