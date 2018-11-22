function [msg] = mensaje(selec)
        if strcmp(selec, 'arch1')
            load('arch1.mat');
            msg = msg1;
        end
        if strcmp(selec, 'arch2')
            load('arch2.mat');
            msg = y_rf_tot;
        end
end
