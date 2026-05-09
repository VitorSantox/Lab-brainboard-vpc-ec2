# Lab Brainboard VNet + VM (Azure)

Projeto de laboratório para estudar **IaC (Infrastructure as Code)** usando **Brainboard** e **Terraform**.  
O objetivo é criar uma infraestrutura simples na **Azure** composta por:

- Uma Virtual Network (VNet)
- Uma Subnet pública
- Um Network Security Group (NSG) com regras básicas
- Uma Máquina Virtual (VM) Linux

## 🚀 Passos para usar

1. **Acesse o Brainboard**  
   Crie uma conta gratuita e abra a interface visual:  
   👉 [Brainboard - Plataforma visual de IaC](https://toolverto.com/pt-BR/tool/brainboard?utm_source=copilot.com)

2. **Desenhe a arquitetura**  
   - VNet com CIDR `10.0.0.0/16`
   - Subnet pública `10.0.1.0/24`
   - NSG permitindo SSH (porta 22)
   - VM Linux ligada à subnet

3. **Exporte o código Terraform**  
   - O Brainboard gera automaticamente os arquivos `.tf`
   - Salve-os na pasta `terraform/` deste repositório

4. **Aplicar com Terraform**  
   ```bash
   terraform init
   terraform plan
   terraform apply
