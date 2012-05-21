package cleanDemo.core.catalog.domain;

import org.broadleafcommerce.common.presentation.*;
import org.broadleafcommerce.core.catalog.domain.ProductSkuImpl;
import org.broadleafcommerce.core.store.domain.ZipCode;
import org.broadleafcommerce.core.store.domain.ZipCodeImpl;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "PRODUCT_SKU_MYCOMPANY")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@AdminPresentationOverrides(
    {
        @AdminPresentationOverride(name="name", value=@AdminPresentation(friendlyName="My Product Name", order=1, group="Product Description", prominent=true, columnWidth="25%", groupOrder=1)),
        @AdminPresentationOverride(name="zipCode.zipcode", value=@AdminPresentation(friendlyName="Zip Code", prominent=true))
    }
)
@AdminPresentationClass(populateToOneFields = PopulateToOneFieldsEnum.TRUE, friendlyName = "My Company Product")
public class SampleProductImpl extends ProductSkuImpl implements SampleProduct {

	private static final long serialVersionUID = 1L;
	
	@Column(name = "RESTRICTED")
	@AdminPresentation(friendlyName ="Restricted", order=9, group ="Description")
	protected Boolean restricted;
	
	@ManyToMany(targetEntity = ShippingCountryImpl.class)
	@JoinTable(name = "CATEGORY_SHIPPING_COUNTRY_XREF", joinColumns = @JoinColumn(name = "CATEGORY_ID"), inverseJoinColumns = @JoinColumn(name = "SHIPPING_COUNTRY_ID", nullable=true))
	@Cascade(value={org.hibernate.annotations.CascadeType.MERGE, org.hibernate.annotations.CascadeType.PERSIST})
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region="blStandardElements")
	@BatchSize(size = 50)
	protected List<ShippingCountry> shippingCountries = new ArrayList<ShippingCountry>();

    @ManyToOne(targetEntity = ZipCodeImpl.class)
    @JoinColumn(name = "ZIP_CODE_ID")
    protected ZipCode zipCode;

	public Boolean isRestricted() {
		return restricted;
	}

	public void setRestricted(Boolean restricted) {
		this.restricted = restricted;
	}

	public List<ShippingCountry> getShippingCountries() {
		return shippingCountries;
	}

	public void setShippingCountries(List<ShippingCountry> shippingCountries) {
		this.shippingCountries = shippingCountries;
	}

    public ZipCode getZipCode() {
        return zipCode;
    }

    public void setZipCode(ZipCode zipCode) {
        this.zipCode = zipCode;
    }

    @Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + (restricted ? 1231 : 1237);
		result = prime
				* result
				+ ((shippingCountries == null) ? 0 : shippingCountries
						.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		SampleProductImpl other = (SampleProductImpl) obj;
		if (restricted != other.restricted)
			return false;
		if (shippingCountries == null) {
			if (other.shippingCountries != null)
				return false;
		} else if (!shippingCountries.equals(other.shippingCountries))
			return false;
		return true;
	}
	
}
