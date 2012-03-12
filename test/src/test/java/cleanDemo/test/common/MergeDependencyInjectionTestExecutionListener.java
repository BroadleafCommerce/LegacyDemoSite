package cleanDemo.test.common;

import org.broadleafcommerce.profile.extensibility.context.MergeClassPathXMLApplicationContext;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.test.context.TestContext;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

public class MergeDependencyInjectionTestExecutionListener extends DependencyInjectionTestExecutionListener {

	@Override
	protected void injectDependencies(TestContext testContext) throws Exception {
		MergeClassPathXMLApplicationContext context = BaseTest.getContext();
		Object bean = testContext.getTestInstance();
		AutowireCapableBeanFactory beanFactory = context.getAutowireCapableBeanFactory();
		beanFactory.autowireBeanProperties(bean, AutowireCapableBeanFactory.AUTOWIRE_AUTODETECT, true);
		beanFactory.initializeBean(bean, testContext.getTestClass().getName());
		testContext.removeAttribute(REINJECT_DEPENDENCIES_ATTRIBUTE);
	}

}
