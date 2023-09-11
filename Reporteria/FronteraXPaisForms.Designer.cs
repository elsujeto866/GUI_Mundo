namespace GUI_Mundo.Reporteria
{
    partial class FronteraXPaisForms
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtPais = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnGenerar = new System.Windows.Forms.Button();
            this.btnBorrar = new System.Windows.Forms.Button();
            this.crystalReportViewer1 = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.FronterasXPaisReport1 = new GUI_Mundo.Reporteria.FronterasXPaisReport();
            this.SuspendLayout();
            // 
            // txtPais
            // 
            this.txtPais.Location = new System.Drawing.Point(35, 166);
            this.txtPais.Name = "txtPais";
            this.txtPais.Size = new System.Drawing.Size(126, 22);
            this.txtPais.TabIndex = 1;
            this.txtPais.TextChanged += new System.EventHandler(this.txtPais_TextChanged);
            this.txtPais.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtPais_KeyPress);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 118);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(183, 17);
            this.label1.TabIndex = 2;
            this.label1.Text = "Ingrese el nombre del país";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // btnGenerar
            // 
            this.btnGenerar.Location = new System.Drawing.Point(35, 236);
            this.btnGenerar.Name = "btnGenerar";
            this.btnGenerar.Size = new System.Drawing.Size(121, 41);
            this.btnGenerar.TabIndex = 3;
            this.btnGenerar.Text = "Generar reporte";
            this.btnGenerar.UseVisualStyleBackColor = true;
            this.btnGenerar.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnBorrar
            // 
            this.btnBorrar.Location = new System.Drawing.Point(35, 320);
            this.btnBorrar.Name = "btnBorrar";
            this.btnBorrar.Size = new System.Drawing.Size(121, 41);
            this.btnBorrar.TabIndex = 4;
            this.btnBorrar.Text = "Borrar";
            this.btnBorrar.UseVisualStyleBackColor = true;
            this.btnBorrar.Click += new System.EventHandler(this.btnBorrar_Click);
            // 
            // crystalReportViewer1
            // 
            this.crystalReportViewer1.ActiveViewIndex = 0;
            this.crystalReportViewer1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.crystalReportViewer1.Cursor = System.Windows.Forms.Cursors.Default;
            this.crystalReportViewer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.crystalReportViewer1.Location = new System.Drawing.Point(0, 0);
            this.crystalReportViewer1.Name = "crystalReportViewer1";
            this.crystalReportViewer1.ReportSource = this.FronterasXPaisReport1;
            this.crystalReportViewer1.Size = new System.Drawing.Size(1130, 654);
            this.crystalReportViewer1.TabIndex = 0;
            // 
            // FronteraXPaisForms
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1130, 654);
            this.Controls.Add(this.btnBorrar);
            this.Controls.Add(this.btnGenerar);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtPais);
            this.Controls.Add(this.crystalReportViewer1);
            this.Name = "FronteraXPaisForms";
            this.Text = "FronteraXPaisForms";
            this.Load += new System.EventHandler(this.FronteraXPaisForms_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private CrystalDecisions.Windows.Forms.CrystalReportViewer crystalReportViewer1;
        private FronterasXPaisReport FronterasXPaisReport1;
        private System.Windows.Forms.TextBox txtPais;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnGenerar;
        private System.Windows.Forms.Button btnBorrar;
    }
}