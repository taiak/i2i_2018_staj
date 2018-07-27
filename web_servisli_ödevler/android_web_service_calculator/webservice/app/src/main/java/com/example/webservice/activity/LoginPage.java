package com.example.webservice.activity;

import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.example.webservice.R;
import com.example.webservice.service.ServiceManager;


public class LoginPage extends AppCompatActivity {

    Button btnLogin;
    EditText editTextFirstNumber;
    EditText editTextSecondNumber;
    EditText editTextOperation;
    static TextView textViewResultView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        editTextFirstNumber  = findViewById(R.id.editText_firstNumber);
        editTextSecondNumber = findViewById(R.id.editText_secondNumber);
        editTextOperation    = findViewById(R.id.editText_operation);
        textViewResultView   = findViewById(R.id.textview_result);
        btnLogin = findViewById(R.id.btn_calculate);

        btnLogin.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                String firstNumber  = editTextFirstNumber.getText().toString();
                String secondNumber = editTextSecondNumber.getText().toString();
                String operation    = editTextOperation.getText().toString();
                System.out.println("SIMON SAID: Login Page is started!");

                try {
                    calculateAsyncTask calculator = new calculateAsyncTask();
                    calculator.execute(firstNumber, secondNumber, operation);

                } catch(Exception ex){
                    System.out.println("YASIR SAID:Exception is: " + ex);

                }
                    // LoginAsyncTask login = new LoginAsyncTask();
                    // login.execute(firstNumber), Double.toString(secondNumber));
            }
        });

    }

    public static class calculateAsyncTask extends AsyncTask<String, String, String> {
        @Override
        protected String doInBackground(String... params) {
            Log.d("test", "doInBackground: SIMORE SAID LoginPage.java parametre >> first : " + params[0] + ", second: "+ params[1] + ", third: " + params[2]);
            String firstNumber  = params[0];
            String secondNumber = params[1];
            String operation    = params[2];

            Log.d("test", "doInBackground: first Number: "+ firstNumber + ", secondNumber: " + secondNumber + ", operation : " + operation);
            return ServiceManager.calculator(firstNumber, secondNumber, operation);
        }

        @Override
        protected void onPostExecute(String result) {
            System.out.println("result is: " + result);
            textViewResultView.setText("Result: " + result);
        }
    }
}

