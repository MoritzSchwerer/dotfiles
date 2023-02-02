from pathlib import Path
import torch
import pytorch_lightning as pl


class TestModel(pl.LightningModule):
    def __init__(self):
        super().__init__()
        self.save_hyperparameters()
        self.model = torch.nn.Linear(1, 1)
        
    def forward(self, x):
        return self.model(x)

    def training_step(self, batch, batch_idx):
        x, y = batch
        y_hat = self(x)
        loss = torch.nn.functional.mse_loss(y_hat, y)
        self.log('train_loss', loss)
        return loss

    def configure_optimizers(self):
        return torch.optim.Adam(self.parameters(), lr=0.01)

    def train_dataloader(self):
        return torch.utils.data.DataLoader(
            torch.utils.data.TensorDataset(
                torch.rand(100, 1),
                torch.rand(100, 1),
            ),
            batch_size=32,
        )

    def test_dataloader(self):
        return torch.utils.data.DataLoader(
            torch.utils.data.TensorDataset(
                torch.rand(100, 1),
                torch.rand(100, 1),
            ),
            batch_size=32,
        )

    def test_step(self, batch, batch_idx):
        x, y = batch
        y_hat = self(x)
        loss = torch.nn.functional.mse_loss(y_hat, y)
        self.log('test_loss', loss)
        return loss

    def test_epoch_end(self, outputs):
        avg_loss = torch.stack([x['test_loss'] for x in outputs]).mean()
        self.log('test_loss', avg_loss)
        return avg_loss

    def on_test_epoch_end(self):
        # This is where I want to save the model
        self.save_hyperparameters()
        torch.save(self.state_dict(), 'model.pt')
