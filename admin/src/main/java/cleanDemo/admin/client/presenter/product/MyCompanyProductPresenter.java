package cleanDemo.admin.client.presenter.product;

import cleanDemo.admin.client.datasource.ShippingCountryListDataSourceFactory;
import cleanDemo.admin.client.datasource.ShippingCountrySearchDataSourceFactory;
import cleanDemo.admin.client.view.product.SampleProductDisplay;
import com.smartgwt.client.data.DataSource;
import com.smartgwt.client.data.Record;
import org.broadleafcommerce.admin.client.presenter.catalog.product.OneToOneProductSkuPresenter;
import org.broadleafcommerce.openadmin.client.BLCMain;
import org.broadleafcommerce.openadmin.client.datasource.dynamic.AbstractDynamicDataSource;
import org.broadleafcommerce.openadmin.client.datasource.dynamic.ListGridDataSource;
import org.broadleafcommerce.openadmin.client.presenter.entity.SubPresentable;
import org.broadleafcommerce.openadmin.client.presenter.structure.SimpleSearchJoinStructurePresenter;
import org.broadleafcommerce.openadmin.client.setup.AsyncCallbackAdapter;
import org.broadleafcommerce.openadmin.client.setup.PresenterSetupItem;
import org.broadleafcommerce.openadmin.client.view.dynamic.dialog.EntitySearchDialog;

import java.util.HashMap;

public class MyCompanyProductPresenter extends OneToOneProductSkuPresenter {

	protected SubPresentable shippingCountryPresenter;
	protected HashMap<String, Object> ganzCategoryLibrary = new HashMap<String, Object>();
	
	@Override
	public void bind() {
		super.bind();
		shippingCountryPresenter.bind();
	}
	
	@Override
	protected void changeSelection(final Record selectedRecord) {
		super.changeSelection(selectedRecord);
		final AbstractDynamicDataSource dataSource = (AbstractDynamicDataSource) display.getListDisplay().getGrid().getDataSource();

		shippingCountryPresenter.load(selectedRecord, dataSource, null);
	}
	
	@Override
	public void setup() {
		super.setup();
		
		getPresenterSequenceSetupManager().addOrReplaceItem(new PresenterSetupItem("shippingCountrySearchDS", new ShippingCountrySearchDataSourceFactory(), null, new Object[]{}, new AsyncCallbackAdapter() {
			public void onSetupSuccess(DataSource result) {
				ListGridDataSource shippingCountrySearchDataSource = (ListGridDataSource) result;
				shippingCountrySearchDataSource.resetPermanentFieldVisibility(
					"countryIso",
					"currencyCode"
				);
				EntitySearchDialog shippingCountrySearchView = new EntitySearchDialog(shippingCountrySearchDataSource);
				ganzCategoryLibrary.put("shippingCountrySearchView", shippingCountrySearchView);
			}
		}));
		
		getPresenterSequenceSetupManager().addOrReplaceItem(new PresenterSetupItem("shippingCountryDS", new ShippingCountryListDataSourceFactory(), null, new Object[]{}, new AsyncCallbackAdapter() {
			public void onSetupSuccess(DataSource result) {		
				ListGridDataSource shippingCountryDataSource = (ListGridDataSource) result;
				shippingCountryPresenter = new SimpleSearchJoinStructurePresenter(((SampleProductDisplay) getDisplay()).getShippingCountryDisplay(), (EntitySearchDialog) ganzCategoryLibrary.get("shippingCountrySearchView"), BLCMain.getMessageManager().getString("categorySearchPrompt"));
				shippingCountryPresenter.setDataSource(shippingCountryDataSource, new String[]{"countryIso", "currencyCode"}, new Boolean[]{false, false});
			}
		}));
		
	}

}
