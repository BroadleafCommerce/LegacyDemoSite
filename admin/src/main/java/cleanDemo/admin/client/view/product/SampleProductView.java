package cleanDemo.admin.client.view.product;

import cleanDemo.admin.client.MyCompanyAdminModule;
import com.smartgwt.client.data.DataSource;
import org.broadleafcommerce.admin.client.view.catalog.product.OneToOneProductSkuView;
import org.broadleafcommerce.openadmin.client.view.dynamic.form.FormOnlyView;
import org.broadleafcommerce.openadmin.client.view.dynamic.grid.GridStructureDisplay;
import org.broadleafcommerce.openadmin.client.view.dynamic.grid.GridStructureView;


public class SampleProductView extends OneToOneProductSkuView implements SampleProductDisplay {

	protected GridStructureView shippingCountryDisplay;
	
	@Override
	public void build(DataSource entityDataSource, DataSource... additionalDataSources) {
		super.build(entityDataSource, additionalDataSources);
		shippingCountryDisplay = new GridStructureView(MyCompanyAdminModule.ADMINMESSAGES.shippingCountryListTitle(), false, false);
		((FormOnlyView) dynamicFormDisplay.getFormOnlyDisplay()).addMember(shippingCountryDisplay);
	}

	/* (non-Javadoc)
	 * @see com.ganz.admin.client.view.product.GanzProductDisplay#getAdditionalAttributesDisplay()
	 */
	@Override
	public GridStructureDisplay getShippingCountryDisplay() {
		return shippingCountryDisplay;
	}
	
}
