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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            add_film(title.Text,description.Text,year.Text,diller.SelectedIndex+1,Convert.ToInt32(lenght.Value),Convert.ToInt32(rating.Value));
            all_films();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form2_Load(object sender, EventArgs e)
        {
            diller.Items.Add("İngilizce");
            diller.Items.Add("Türkçe");
            diller.Items.Add("İspanyolca");
            diller.Items.Add("Portekizce");
            all_films();
            id.Maximum = 99999999999;
            id.Minimum = 0;
            lenght.Maximum = 200;
            lenght.Minimum = 30;
            rating.Maximum = 100;
            rating.Minimum = 0;
            Form1 form1 = new Form1();
            form1.Close();

        }
        public void add_film(string title, string description,string release_year, int languege_id, int lenght, int rating)
        {
            NpgsqlConnection conn = new NpgsqlConnection("Server=localhost; Port=5432; Database=tahir; User Id=postgres; Password=zorsifre123;");
            try { conn.Open(); } catch (Exception e) { }
            string sql = "INSERT INTO film (title,description,release_year,languege_id,lenght,rating) values ('" + title + "','" + description + "','" + release_year + "','" + languege_id + "','" + lenght + "','" + rating +"')";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public void all_films()
        {
            listBox1.Items.Clear();
            NpgsqlConnection conn = new NpgsqlConnection("Server=localhost; Port=5432; Database=tahir; User Id=postgres; Password=zorsifre123;");
            conn.Open();
            string sql = "SELECT \"film_id\", \"title\",\"release_year\",\"lenght\",\"rating\" FROM \"film\"";
            // Define a query returning a single row result set
            NpgsqlCommand command = new NpgsqlCommand(sql, conn);

            NpgsqlDataReader dr = command.ExecuteReader();
            while (dr.Read())
            {
                listBox1.Items.Add(dr[0].ToString()+"-) "+dr[1].ToString() + " Yıl:" + dr[2].ToString()+" Süre:"+dr[3].ToString()+" Puan:"+dr[4].ToString());

            }
            conn.Close();

        }

        public void update_film(string title,int rating,int id)
        {
            NpgsqlConnection conn = new NpgsqlConnection("Server=localhost; Port=5432; Database=tahir; User Id=postgres; Password=zorsifre123;");
            try { conn.Open(); } catch (Exception e) { }

            string sql = "UPDATE \"film\" SET \"title\"=\'" + title +"\',\"rating\"=\'" + rating + "\' WHERE \"film_id\"=\'" + id + "\'";
            NpgsqlCommand command = new NpgsqlCommand(sql, conn);
            command.ExecuteNonQuery();
            conn.Close();
        }

        public void delete_movie(int id)
        {
            NpgsqlConnection conn = new NpgsqlConnection("Server=localhost; Port=5432; Database=tahir; User Id=postgres; Password=zorsifre123;");
            try { conn.Open(); } catch (Exception e) { }

            string sql = "DELETE FROM film WHERE film_id ='" + id + "'";
            NpgsqlCommand command = new NpgsqlCommand(sql, conn);
            command.ExecuteNonQuery();
            conn.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            update_film(title.Text, Convert.ToInt32(rating.Value),Convert.ToInt32(id.Value));

            all_films();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            delete_movie(Convert.ToInt32(id.Value));
            all_films();
        }

        private void id_ValueChanged(object sender, EventArgs e)
        {

        }

        private void lenght_ValueChanged(object sender, EventArgs e)
        {

        }
    }
}
