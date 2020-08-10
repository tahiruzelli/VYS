using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Npgsql;

namespace tahir_vys
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            
            if (giris(textBox1.Text, textBox2.Text) == true) {
                form2.Show();
                

            }
            else
                MessageBox.Show("Hatalı Giriş");
            
            
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
        public bool giris(string username,string pass)
        {
            NpgsqlConnection conn = new NpgsqlConnection("Server=localhost; Port=5432; Database=tahir; User Id=postgres; Password=zorsifre123;");
            conn.Open();
            string sql = "SELECT password FROM staff WHERE username ='" + username + "'";
            NpgsqlCommand command = new NpgsqlCommand(sql, conn);

            string sifre = command.ExecuteScalar().ToString();
            conn.Close();
            if (pass == sifre)
                return true;
            else
                return false;
            

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            MessageBox.Show("draven,breadon,alice veya sonradan eklenilen kullanıcıadlarından biri ile giriş yapmayı denemezseniz program patlayacaktır.");
        }
    }
}
