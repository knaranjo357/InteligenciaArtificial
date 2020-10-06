function [TrainingC1,ValidationC1,TestC1,TrainingC2,ValidationC2,TestC2,RandC1,RandC2] = Separar(databaseC1,databaseC2,porcentajeTraining,porcentajeValidation,porcentajeTest)

%saber el numero de patrones de cada base de datos
[patronesC1,~]=size(databaseC1);
[patronesC2,~]=size(databaseC2);

%saber cuanto es el numero de manera automatica
    %C1
        num_validation_C1=round(patronesC1*porcentajeValidation);
        num_test_C1=round(patronesC1*porcentajeTest);
        num_training_C1=patronesC1-num_validation_C1-num_test_C1;
    %C2
        num_validation_C2=round(patronesC2*porcentajeValidation);
        num_test_C2=round(patronesC2*porcentajeTest);
        num_training_C2=patronesC2-num_validation_C2-num_test_C2;
        
RandC1=randperm(patronesC1);
RandC2=randperm(patronesC2);

listaTrainingC1 = 1:num_training_C1;
listaValidationC1 = (num_training_C1+1):(num_training_C1+num_validation_C1);
listaTestC1 = (num_training_C1+num_validation_C1+1):patronesC1;

listaTrainingC2 = 1:num_training_C2;
listaValidationC2 = (num_training_C2+1):(num_training_C2+num_validation_C2);
listaTestC2 = (num_training_C2+num_validation_C2+1):patronesC2;


%separar training validation test Metal
TrainingC1 = databaseC1(RandC1(listaTrainingC1),:);
ValidationC1 = databaseC1(RandC1(listaValidationC1),:);
TestC1 = databaseC1(RandC1(listaTestC1),:);

%separar training validation test Roca
TrainingC2 = databaseC2(RandC2(listaTrainingC2),:);
ValidationC2 = databaseC2(RandC2(listaValidationC2),:);
TestC2 = databaseC2(RandC2(listaTestC2),:);


end

