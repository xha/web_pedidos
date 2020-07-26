<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class CompraItem
 * 
 * @property int $idCompraItem
 * @property int $idCompra
 * @property int $idItem
 * @property int $numeroLinea
 * @property string $descripcionItem
 * @property float $cantidad
 * @property float $costo
 * @property float $precio
 * @property float $impuesto
 * @property float $descuento
 * @property float $montoTotal
 * @property bool $esExento
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Compra $compra
 * @property Item $item
 * @property Collection|CompraImpuestoItem[] $compra_impuesto_items
 *
 * @package App\Models
 */
class CompraItem extends Model
{
	protected $table = 'compra_item';
	protected $primaryKey = 'idCompraItem';
	public $timestamps = false;

	protected $casts = [
		'idCompra' => 'int',
		'idItem' => 'int',
		'numeroLinea' => 'int',
		'cantidad' => 'float',
		'costo' => 'float',
		'precio' => 'float',
		'impuesto' => 'float',
		'descuento' => 'float',
		'montoTotal' => 'float',
		'esExento' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'idCompra',
		'idItem',
		'numeroLinea',
		'descripcionItem',
		'cantidad',
		'costo',
		'precio',
		'impuesto',
		'descuento',
		'montoTotal',
		'esExento',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function compra()
	{
		return $this->belongsTo(Compra::class, 'idCompra');
	}

	public function item()
	{
		return $this->belongsTo(Item::class, 'idItem');
	}

	public function compra_impuesto_items()
	{
		return $this->hasMany(CompraImpuestoItem::class, 'idCompraItem');
	}
}
