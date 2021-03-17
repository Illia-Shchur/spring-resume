package net.study.resume.component;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.file.Path;

@Component
public class JpegTranImageOptimizer implements ImageOptimizer {
    private static final Logger LOGGER = LoggerFactory.getLogger(JpegTranImageOptimizer.class);

    @Value("${media.optimization.jpegtran}")
    private String jpegtran;

    @Override
    public void optimize(Path imageFile) {
        try {
            optimizeImageFile(imageFile);
        } catch (Exception e) {
            LOGGER.error("Can't optimize imageFile: "+e.getMessage(), e);
        }
    }

    protected void optimizeImageFile(Path imageFile) throws IOException, InterruptedException {
        Process process = null;
        try {
            String toolCmd = getToolCmd(imageFile);
            process = Runtime.getRuntime().exec(toolCmd);
            int code = process.waitFor();
            LOGGER.debug("Optimize cmd {} completed with code={}", toolCmd, code);
        }finally {
            if(process != null) {
                process.destroy();
            }
        }
    }

    protected String getToolCmd(Path imageFile) {
        return jpegtran+"/jpegtran.exe" + getToolOptions() + " -outfile " + imageFile + " " + imageFile;
    }

    protected String getToolOptions(){
        return " -copy none -optimize -progressive ";
    }
}
