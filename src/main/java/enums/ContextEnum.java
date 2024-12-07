package enums;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public enum ContextEnum {
	INSTANCE;

	private AbstractApplicationContext context;

	private ContextEnum() {
        // Inicializar el contexto de Spring desde el archivo applicationContext.xml
		if(context == null) {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        }
    }

	public AbstractApplicationContext getContext() {
		return context;
	}

	public void closeContext() {
		context.close();
	}
}
